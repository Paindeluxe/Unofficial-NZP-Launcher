#!/bin/bash
### Unofficial NZP Launcher Version 1.1.0 by Pain deluxe

# Detecting CPU Architecture.
ARCH="$(uname -m)"
# Switch Statement as long Else If Statements look weird.
         case ${ARCH} in 
# 64-Bit x86
  x86_64)
    echo "Detected x86_64 CPU"
    SRC="https://github.com/nzp-team/nzportable/releases/download/nightly/nzportable-linux64.zip"
    ZIP="nzportable-linux64"
    EXE="nzportable64-sdl"
    ;;
# 32-Bit x86
  i686)
    echo "Detected i686 CPU"
    SRC="https://github.com/nzp-team/nzportable/releases/download/nightly/nzportable-linux32.zip"
    ZIP="nzportable-linux32"
    EXE="nzportable32-sdl"
    ;;
# 64-Bit Arm
  arm64)
    echo "Detected arm64 CPU"
    SRC="https://github.com/nzp-team/nzportable/releases/download/nightly/nzportable-linuxarm64.zip"
    ZIP="nzportable-linuxarm64"
    EXE="nzportablearm64-sdl"
    ;;
# 32-Bit Arm
  armv7l)
    echo "Detected armv7l CPU"
    SRC="https://github.com/nzp-team/nzportable/releases/download/nightly/nzportable-linuxarmhf.zip"
    ZIP="nzportable-linuxarmhf"
    EXE="nzportablearmhf-sdl"
    ;;

  *)
    ;;
esac

function UPDATE {
        # Preparing for the Download
        echo -e "\033[31mDeleting the Contents of the "temp" Folder, to avoid Errors with incomplete Downloads.\033[0m"
        rm -r ./temp
        mkdir ./temp
        mkdir -p ./modifications/
        # Getting latest Version
        echo "${SRC}"
        wget -P ./temp "${SRC}" -q --show-progress
        # Moving the .zip Archive out of the temp Folder.
        mv ./temp/"${ZIP}".zip ./
            # Removing the "nzp" Folder to avoid unlikely, but possible Issues or to just save Space if future Updates cause duplicate Files due to changes in the Folder Structure.
            # echo -e "\033[31mArchaiclly deleting the entire "nzp" Folder to avoid possible Issues with future Updates...\033[31m"
            # rm -r ./nzp
        # Unzipping .zip Archive and delete .zip Archive
        unzip -q -o ./"${ZIP}".zip && rm ./"${ZIP}".zip
}

function MODANDLAUNCH {
        # Updating "nzp" with "modifications"
        echo -e "\033[32mAdding Modifications from "modifications"!\033[0m"
        cp -r -f -T ./modifications/ ./nzp
        # Make the Executable Runnable, then run.
        chmod +x ./"${EXE}"
        echo -e "\033[32mStarting NZP.\033[0m"
        ./"${EXE}"
}

if [ -e ./"${EXE}" ]
then
    echo -e "\033[32mNZP is Installed, checking if the currently installed Version is out of Date.\033[0m"
    # Preparing the current Date in Unix Time as a Variable.
    CURDATE="$(date +'%s')"
    echo "Current Time in Unix is ${CURDATE}"

    # Preparing the Game Application's Creation Date in Unix Time as a Variable.
    NZPDATE="$(stat -c %X ./${EXE})"
    echo "${EXE} Time in Unix is ${NZPDATE}"

    # Checking if the Age of the Game Executable is older than 1 Day in Unix Time.
    RESULT="$((${CURDATE} - ${NZPDATE}))"
    echo "The Difference between ${CURDATE} and ${NZPDATE} is ${RESULT}!"
    if [ "${RESULT}" -gt "86400" ]

        then
        echo -e "\033[32mLast installed Update was installed over a Day ago, Time to Update!\033[0m"
        # Re-using the UPDATE Function to help readibilty and avoid duplicates. 
        UPDATE
        # Re-using the MODANDLAUNCH Function to help readibilty and avoid duplicates.
        MODANDLAUNCH
    else
        echo -e "\033[32mLast installed Update was installed under a Day ago, we don't have to update!\033[0m"
        # Re-using the MODANDLAUNCH Function to help readibilty and avoid duplicates.
        MODANDLAUNCH
    fi
else 
    echo -e "\033[32mNZP is not Installed or it got moved. Now Installing NZP!\033[0m"
    echo "By the Way, could you please read the "README.md" if you haven't already?"
    # Re-using the UPDATE Function to help readibilty and avoid duplicates.
    UPDATE
    # Re-using the MODANDLAUNCH Function to help readibilty and avoid duplicates.
    MODANDLAUNCH
fi
