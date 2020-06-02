#!/bin/bash

AVR_MCU=""
HEX_FILE=""
PROGRAMMER="dragon_isp"

if [ -n "$1" ]
    then
        AVR_MCU=$1
fi

if [ -n "$2" ]
    then
        HEX_FILE=$2
fi

if [ -n "$3" ]
    then
        PROGRAMMER=$3
fi

cd build
avrdude -p ${AVR_MCU} -c ${PROGRAMMER} -P usb -e -U flash:w:${HEX_FILE}

