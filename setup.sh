#!/bin/bash

update_and_upgrade {
    sudo apt-get -y --force-yes update
    sudo apt-get -y --force-yes upgrade
}

install_software {
    sudo apt-get install vim tmux git \
        elinks
}

install_nonstandard_software() {
    sudo apt-get install gcc make \
        libx11-dev libxft-dev libxext-dev
    $(
        git clone git://git.suckless.org/st "$HOME"/st
        cd "$HOME"/st
        mkdir patches
        cd patches
        curl -O http://st.suckless.org/patches/st-hidecursor-git-20160620-528241a.diff
        cd ..
        git apply patches/st-hidecursor-git-20160620-528241a.diff
        sudo make clean install
    )
}

update_and_upgrade &&
install_software &&
install_nonstandard_software

