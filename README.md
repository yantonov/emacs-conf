## Emacs-conf
Emacs configuration.  
Emacs config files is supposed to be placed at ~/emacs (emacs dir inside user home directory).

## Installation

### Linux/Unix

1. clone repository to ~/emacs
2. to install all used modes run ~/emacs/install/setup.sh
3. add line to ~/.emacs initialization file  
    `(load (concat (getenv "HOME") "/emacs/init.el"))`

### Windows

1. clone repository to user home directory (for example C:/Users/username/emacs)
2. Set HOME environment variable to home directory (C:/Users/username)
3. install windows port of [wget](http://gnuwin32.sourceforge.net/packages/wget.htm)
4. run git bash (included in git dist for windows) then install all used modes by running setup.sh script (C:/Users/username/emacs/install/setup.sh).
5. add line to ~/.emacs initialization file  
    `(load (concat (getenv "HOME") "/emacs/init.el"))`

### Mac os
1. clone repository to ~/emacs
2. to install all used modes run ~/emacs/install/setup.sh
3. add line to ~/.emacs initialization file  
    `(load (concat (getenv "HOME") "/emacs/init.el"))`
4. Fix PATH environment problem.  
Programs which has launched from spotlight has different environment variables than whose who launched from terminal.  
Suppose you add some additional dirs to PATH ($ADDITIONAL_PATH)  
Add something like this to your .profile :  

    \# patch PATH for terminal programs  
    export PATH=$ADDITIONAL_PATH:$PATH  
    \# patch PATH for gui (and spotlight in particular)  
    OLD_GUI_PATH=\`launchctl getenv PATH\`  
    if [[ $OLD_GUI_PATH != *$ADDITIONAL_GUI_PATH* ]]  
    then  
        NEW_GUI_PATH=$ADDITIONAL_PATH:$OLD_GUI_PATH  
        launchctl setenv PATH $NEW_GUI_PATH  
    fi

