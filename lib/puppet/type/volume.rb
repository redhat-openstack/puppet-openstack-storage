require 'puppet'

module Puppet
  Puppet::Type.newtype(:volume) do
    @doc = 'A storage volume'

    ensurable

    newparam(:name) do
      isnamevar
      desc 'Volume name'
    end

    newparam(:path) do
      desc 'Volume path'
    end

    newparam(:peers) do
      desc 'Cluster peers'
    end

    newparam(:replica_count) do
      desc 'Replication count'

      defaultto 2

      validate do |value|
        if value.to_i.class != Fixnum || value.to_i < 0
          raise ArgumentError, "Requires a positive integer"
        else
          super
        end
      end
    end
  end
end
