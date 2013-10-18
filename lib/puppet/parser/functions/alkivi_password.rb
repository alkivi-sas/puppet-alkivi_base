# Simply output the correct password, use gen password, sudo is necessary, might be a security issue ... try to fix it !
# Password are thus always store on puppet master
require 'digest/md5'

module Puppet::Parser::Functions
  newfunction(:alkivi_password, :type => :rvalue, :doc => <<-EOS
    Returns locally generated password
    EOS
  ) do |args|

      raise(Puppet::ParseError, "alkivi_password(): Wrong number of arguments " +
        "given (#{args.size} for 2)") if args.size != 2

      name = args[0]
      type = args[1]
      fqdn = lookupvar('fqdn')

      # declare root dir
      if type == 'user'
        dir = "/root/.passwd/#{fqdn}"
      elsif type == 'db'
        dir = "/root/.passwd/#{fqdn}/db"
      elsif type == 'hosts'
        dir = "/root/.passwd/#{fqdn}/hosts"
      elsif type == 'backup'
        dir = "/root/.passwd/#{fqdn}/alkivi-backup"
      elsif type == 'ldap'
        dir = "/root/.passwd/#{fqdn}/ldap"
      elsif type == 'ups'
        dir = "/root/.passwd/#{fqdn}/ups"
      else
        raise(Puppet::ParseError, "Type '#{type}' is incorrect")
      end

      # Generate password
      password = `/usr/bin/sudo /root/alkivi-scripts/genpwd --save #{name} --savedir #{dir} --print`
      unless $?.success?
        raise "Password generation failed"
      end

      password
    end
end
