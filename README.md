Configurations
==============

A repository for applying version control to a host of different configuration files (dotfiles, rc-files,...).

This repository serves as a central storage of my different configurations for vim, bash,... 
It's easy to manage the configurations on different hosts when using git. 
Most of the content is of my own making, but I have looked around on the internet for interesting features and configurations.
Also some useful scripts have been added. Might come in handy in the future.

If you find snippets of code in one of the files here, feel free to let me know and I will credit you for it.

The gitrepository is located relative to the homedir '~'.

At this moment, I have configurations for: 
    
    - Vim (.vimrc and .vim folder)
        Please note that Pathogen is used for plugin management, the subfolder of .vim/bundles can be gitrepositories themselves.
        The content of those repositories are not included and u should clone them yourself.
        The folder indicates the name of the repo. All of them can be found on github.

    - Bash (.bashrc_{local,remote1})
        I use different .bashrc scripts for different hosts to give them a bit of a different color scheme.
        The files are annotated with local or remote to differentiate on location of the hosts that use them.
    
    - XMonad (.xmonad folder) 
        Configuration files for xmonad and xmobar. For xmonad, there is a haskell config file xmonad.hs
        For xmobar there is a dot file .xmobarrc to configure it.
    - MPD 
        Music Player Daemon configuration files. 

        

