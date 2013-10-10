# Alkivi Base Module

This module will provide basic tools that we install on our machine.
It include :
- ssh keys 
- default software
- provide hability to quickly create password and credentials for our api
- remove default motd and add an executble in /etc/profile.d to allow dynamic motd

## Usage

You have to create your own templates in :
- templates/alkivi_authorized_keys.erb
- templates/root_authorized_keys.erb

## Limitations

* This module has been tested on Debian Wheezy, Squeeze.

## License

All the code is freely distributable under the terms of the LGPLv3 license.

## Contact

Need help ? contact@alkivi.fr

## Support

Please log tickets and issues at our [Github](https://github.com/alkivi-sas/)
