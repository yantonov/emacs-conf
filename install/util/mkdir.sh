#/bin/bash

# creates directories if needed

DIR_TO_CREATE=$1
WD=`pwd`

if [ -n ${DIR_TO_CREATE} ]; then
  if [ ! -d ${DIR_TO_CREATE} ];then
      mkdir -p ${DIR_TO_CREATE}
  fi
fi