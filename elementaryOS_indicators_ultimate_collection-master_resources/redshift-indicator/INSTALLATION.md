##########################################
# REDSHIFT-INDICATOR ICON - INSTALLATION #
##########################################


- how to get redshift (download from official ppa):

    sudo apt-get install redshift
    
- paste icon in:

    /usr/share/icons/Numix-Circle/22x22/status/

- reload wingpanel

    killall wingpanel

- how to set up redshift with config file:

    -paste redshift.conf in ~/.config directory
    -change color temperatures or leave by default in lines: 4 and 5 
    -redshift will detect your location every time on boot, so there is no need to change that settings

- more information:

  http://www.travelmath.com/cities/ - there you can find latitude/longitude for your city    
  https://badlinuxadvice.wordpress.com/2013/01/09/how-to-setup-redshift-to-be-like-f-lux/
  http://jonls.dk/redshift/

- credits:

    -fsvh-version taken from: https://github.com/fsvh/freya-indicators

- If you like my work please consider small donation in BTC
  wallet address: 3MebmSvPAp4nSuy9auVQqS53rQtCcmuKFw

best regards,
S.Kaczmarek
