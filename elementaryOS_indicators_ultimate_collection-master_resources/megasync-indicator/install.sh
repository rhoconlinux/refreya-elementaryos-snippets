#!/bin/bash

# variables

tx1="\e[0;32m Do you want to install patched version of sni-qt? [Y/N] \n This is necessary to replace Mega Sync status icons. \n If you already have patched sni-qt and only want to chose icons set skip this step [N] \e[0m"
tx2="\e[0;32m Which icons set do you want to install? \e[0m"
tx3="\e[0;32m icons-circle [a] \e[0m" 
tx4="\e[0;32m icons-cloud  [b] \e[0m"  
tx5="\e[0;32m Adding the repository \e[0m"
tx6="\e[0;32m Updating package list \e[0m"
tx7="\e[0;32m Installing packages   \e[0m"
tx8="\e[0;32m Creating directory    \e[0m"
tx9="\e[0;32m Copying files to the directory \e[0m"
tx10="\e[0;32m Reverting MEGAsync application launchers \e[0m"
tx11="\e[0;32m Killing MEGAsync \e[0m"
tx12="\e[0;32m Run MEGAsync from menu! \e[0m"

dir1=icons-circle
dir2=icons-cloud

# functions

sni-qt_installation()
{
    echo -e $tx5
    sudo add-apt-repository --yes ppa:cybre/sni-qt-eplus

    echo -e $tx6
    sudo apt-get -y update
    
    echo -e $tx6
    sudo apt-get -y install sni-qt sni-qt:i386
}

icons_replacement()
{
    x=$1    #argument

    echo -e $tx8
    mkdir -p $HOME/.local/share/sni-qt/icons
    
    echo -e $tx9
    cp ./$x/* $HOME/.local/share/sni-qt/icons/                                          
    
    echo -e $tx10
    newpath="Exec=$HOME/.bin/megasync-wrapper/megasync.sh"
    sudo sed -i "s|"$newpath"|Exec=megasync|g" /usr/share/applications/megasync.desktop
    sed -i "s|"$newpath"|Exec=megasync|g" $HOME/.config/autostart/megasync.desktop

    echo -e $tx11
    killall megasync
    
    echo -e $tx12
    exit
}

icons_menu()
{
        echo -e $tx2
        echo -e $tx3
        echo -e $tx4
        
        read ab

if      [[ $ab =~ ^[Aa]$ ]]; then

        icons_replacement $dir1


elif    [[ $ab =~ ^[Bb]$ ]]; then

        icons_replacement $dir2

fi
}

##########
# SCRIPT #
##########

echo -e $tx1 

read yn

if      [[ $yn =~ ^[Yy]$ ]]; then
    
        sni-qt_installation

        icons_menu

       
elif    [[ $yn =~ ^[Nn]$ ]]; then

        icons_menu
fi
