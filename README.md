# Emacs-conf
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
