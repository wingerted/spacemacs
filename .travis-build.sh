#!/usr/bin/env bash
## run_build.sh --- Travis CI File for Spacemacs
##
## Copyright (c) 2012-2014 Sylvain Benner
## Copyright (c) 2014-2015 Sylvain Benner & Contributors
##
## Author: Sylvain Benner <sylvain.benner@gmail.com>
## URL: https://github.com/syl20bnr/spacemacs
##
## This file is not part of GNU Emacs.
##
## License: GPLv3

tests=("core")

if [ $USER != "travis" ]; then
    echo "This script is not designed to run locally."
    echo "Instead, navigate to the appropriate test folder and run make there instead."
    exit 1
fi

if  [ $TRAVIS_SECURE_ENV_VARS = false ] &&
    [ $TRAVIS_PULL_REQUEST != false ] &&
    [ $TRAVIS_BRANCH = "master" ]; then

    	printf '=%.0s' {1..70}
    	printf "\n       し(*･∀･)／   Thanks for the contribution!  ＼(･∀･*)ノ\n"
    	printf '=%.0s' {1..70}
    	printf "\n( ＾◡＾)っ Please submit your pull request against the develop branch.\n"
    	echo   "You can read the contribution guidelines at:"
    	echo   "https://github.com/syl20bnr/spacemacs/blob/develop/CONTRIBUTING.org"
    	exit 1
fi

echo "Pwd $(pwd)"
rm -rf ~/.emacs.d
ln -sf `pwd` ~/.emacs.d

for test in "${tests[@]}"; do
    rm -rf ~/.emacs.d/elpa
    rm -rf ~/.emacs.d/.cache
    rm -f ~/.spacemacs

    testdir=~/.emacs.d/tests/$test
    echo "Running '$test' in '$testdir' folder"
    if [ -f $testdir/dotspacemacs.el ]; then
        cp $testdir/dotspacemacs.el ~/.spacemacs
    fi
    cd $testdir && echo "Now in $(pwd)"
    make test || exit 2
done
