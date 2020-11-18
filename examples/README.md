### Быстрый старт

* `CMakeLists.txt`  пример проекта.

* `.vscode` настройки VS Code при интеграция сборки с отладчиком.
##### cmake-kits.json
```javascript
[
    {
        "name": "GCC AVR",
        "toolchainFile": "avr-cmake-toolchains/avr-gcc-toolchain.cmake"
    }
]
```

#### program.sh файл скрипта для программирования утилитой avrdude.
Старт скрипта `./program.sh m8 blinking_led.hex dragon_isp` или `./program.sh m8 blinking_led.hex`
* `m8` - МК
* `blinking_led.hex` - файл прошивки
* `dragon_isp` - программатор(по умолчанию dragon_isp)

##### program.sh
```sh
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
```
