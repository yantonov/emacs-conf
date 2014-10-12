#!/bin/bash

# update package list
cabal update

# install happy otherwise WTF ?!? you cant install stylish-haskell or ghc-mod
cabal install happy


cabal install hasktags
cabal install stylish-haskell
cabal install ghc-mod
cabal install hlint
cabal install hoogle
hoogle data
