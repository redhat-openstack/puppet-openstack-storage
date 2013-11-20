require 'fileutils'
require 'puppet'

Puppet::Type.type(:volume).provide(:gluster) do
  desc 'glusterfs volume management'

  optional_commands :gluster => '/usr/sbin/gluster'

  def exists?
    volume_exist?
  rescue Puppet::ExecutionFailure
    return false
  end

  def create
    cluster = Cluster.new(@resource[:peers])
    if cluster.attached?
      #  gluster('volume', 'create', @resource[:name], 'replica', @resource[:replica_count], bricks)
      volume_dir = File.dirname(@resource[:path])
      unless File.exist?(volume_dir)
        FileUtils.mkdir_p(volume_dir)
      end
      %x(/usr/sbin/gluster volume create #{@resource[:name]} replica #{@resource[:replica_count]} #{bricks})
      gluster('volume', 'start', @resource[:name]) if $?
    end
  end

  def destroy
    # Not working: gluster command needs keyboard confirmation!
    # gluster('volume', 'stop', @resource[:name])
    # gluster('volume', 'delete', @resource[:name])
  end

  private

  def bricks
    list = ''
    @resource[:peers].each do |brick|
      list << "#{brick}:#{@resource[:path]} "
    end
    return list
  end
  
  def volume_exist?
    return true if gluster('volume', 'info',  resource[:name])
  rescue Puppet::ExecutionFailure
    return false
  end

  class Gluster
    def initialize(host)
      @host = host
    end

    def probe
      %x(/usr/sbin/gluster peer probe #{@host})
      return true if $? == 0
    end
  end

  class Cluster
    def initialize(peers)
      @peers = peers
      @cluster = []
      @peers.each { |peer|
        @cluster << Gluster.new(peer)
      }
    end

    def attached?
      @cluster.each { |host| 
        return false unless host.probe
      }
    end
  end
end
