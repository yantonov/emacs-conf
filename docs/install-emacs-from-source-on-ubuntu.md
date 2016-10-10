### How to install latest emacs from source on ubuntu
 
    # install X development libraries:

    sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev -y  
    sudo -K
 
    # download emacs dist from [official site](http://www.gnu.org/software/emacs/#Obtaining "obtaining emacs")

    EMACS_VERSION="25.1"
    DIST_FILE_NAME="emacs-$EMACS_VERSION.tar.xz"
    EXTRACTED_DIR="emacs-$EMACS_VERSION"
    EMACS_DIST_URL="http://mirror.tochlab.net/pub/gnu/emacs/$DIST_FILE_NAME"
    DESTINATION_PARENT="$HOME/Development/bin"
    DESTINATION_DIR="emacs-$EMACS_VERSION"

    # download    
    cd ~/Downloads  
    curl -O -L "$EMACS_DIST_URL"

    # unpack
    tar xvf $DIST_FILE_NAME
    
    # goto unpacked directory
    cd $EXTRACTED_DIR
 
    # configure before install: specify directory to install emacs  
    # (otherwise it will be installed into /usr/bin)
    mkdir -p $HOME/Development/bin/emacs-$EMACS_VERSION
    ./configure --prefix=$DESTINATION_PARENT/$DESTINATION_DIR
 
    # build
    make

    # install
    make install

    # create symboling link
    cd $DESTINATION_PARENT
    # delete old link
    rm emacs
    ln -s `pwd`/$DESTINATION_DIR emacs

    # clean up   
    cd ~/Downloads
    rm -rf $EXTRACTED_DIR*
    
