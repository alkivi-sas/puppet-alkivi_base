# Simply output the correct password, use gen password, sudo is necessary, might be a security issue ... try to fix it !
# Password are thus always store on puppet master
module Puppet::Parser::Functions
  newfunction(:alkivi_password_hash, :type => :rvalue, :doc => <<-EOS
    Returns locally generated hash
    EOS
  ) do |args|

      raise(Puppet::ParseError, "alkivi_password_hash(): Wrong number of arguments " +
        "given (#{args.size} for 2)") if (args.size < 2 && args.size > 3)

      name   = args[0]
      type   = args[1]
      length = args[2]
      fqdn   = lookupvar('fqdn')

      if ! length
          length = 15
      end

      # declare root dir
      if type == 'user'
        dir = "/root/.passwd/#{fqdn}"
      elsif type == 'backup'
        dir = "/root/.passwd/#{fqdn}/alkivi-backup"
      else
        dir = "/root/.passwd/#{fqdn}/#{type}"
      end

      # Generate password remove newline if present
      password = `/usr/bin/sudo /root/alkivi-scripts/genpwd --save #{name} --savedir #{dir} --hash --print --length #{length}`.tr("\n","")
      unless $?.success?
        raise "Password generation failed"
      end

      password
    end
end
