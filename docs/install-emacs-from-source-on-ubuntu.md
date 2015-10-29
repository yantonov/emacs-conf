### How to install latest emacs from source on ubuntu
 
    # install X development libraries:

    sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev -y  
    sudo -K
 
    # download emacs dist from [official site](http://www.gnu.org/software/emacs/#Obtaining "obtaining emacs")

    cd ~/Downloads  
    wget http://mirror.tochlab.net/pub/gnu/emacs/emacs-24.3.tar.xz

    # unpack

    tar xvf emacs-24.3.tar.xz

    # goto unpacked directory

    cd emacs-24.3
 
    # configure before install: specify directory to install emacs  
    # (otherwise it will be installed into /usr/bin)

    mkdir -p $HOME/Development/bin/emacs-24.3
    ./configure --prefix=$HOME/Development/bin/emacs-24.3
 
    # build

    make

    # install

    make install

    # create symboling link

    $ cd $HOME/Development/bin/
    ln -s `pwd`/emacs-24.3 emacs

    # clean up
    
    cd ~/Downloads
    rm -rf emacs-24.3*
    
