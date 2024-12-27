#!/bin/bash
### Unofficial NZP Launcher Version 1.1.0 by Pain deluxe

# Detecting CPU Architecture.
ARCH="$(uname -m)"
    if [[ ${ARCH} == x86_64 ]]
    then SRC="https://github.com/nzp-team/nzportable/releases/download/nightly/nzportable-linux64.zip"
         ZIP="nzportable-linux64"
         EXE="nzportable64-sdl"
         echo "Detected x86_64 CPU"

    else SRC="https://github.com/nzp-team/nzportable/releases/download/nightly/nzportable-linux32.zip"
         ZIP="nzportable-linux32"
         EXE="nzportable32-sdl"
         echo "Detected i686 CPU"
fi
# Check if NZP is already installed
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
        # Preparing for the download
        echo -e "\033[31mRemoving the "temp" Folder, to avoid Errors with incomplete Downloads.\033[0m"
        rm -r ./temp
        mkdir ./temp
        mkdir -p ./modifications/
        # Getting latest Version
        echo "${SRC}"
        wget -P ./temp "${SRC}" -q --show-progress
        # Moving the .zip Archive out of the temp Folder.
        mv ./temp/"${ZIP}".zip ./temp/
        # Removing the "nzp" Folder to avoid unlikely, but possible Issues or to just save Space if future Updates cause duplicate Files due to changes in the Folder Structure.
        # echo -e "\033[31mArchaiclly deleting the entire "nzp" Folder to avoid possible Issues with future Updates...\033[31m"
        # rm -r ./nzp
        # Unzipping .zip Archive and delete .zip Archive
        unzip -q -o ./"${ZIP}".zip && rm ./"${ZIP}".zip
        # Updating "nzp" with "modifications"
        echo -e "\033[32mAdding Modifications from "modifications"!\033[0m"
        cp -r -f -T ./modifications/ ./nzp
        # Make the Executable Runnable, then run.
        chmod +x ./"${EXE}"
        echo -e "\033[32mStarting NZP.\033[0m"
        ./"${EXE}"
    else
        echo -e "\033[32mLast installed Update was installed under a Day ago, we don't have to update!\033[0m"
        # Updating "nzp" with "modifications"
        echo -e "\033[32mAdding Modifications from "modifications"!\033[0m"
        cp -r -f -T ./modifications/ ./nzp
        echo -e "\033[32mStarting NZP.\033[0m"
        ./"${EXE}"
    fi
else 
    echo -e "\033[32mNZP is not Installed or it got moved. Now Installing NZP!\033[0m"
    echo "By the Way, could you please read the "README.txt" if you haven't already?"
    # Preparing for the download
    echo -e "\033[31mRemoving the "temp" Folder, to avoid Errors with incomplete Downloads.\033[0m"
    rm -r ./temp
    mkdir ./temp
    mkdir -p ./modifications
    # Getting latest Version.
    echo "${SRC}"
    wget -P ./temp "${SRC}" -q --show-progress
    # Moving the .zip Archive out of the temp Folder.
    mv "./temp/${ZIP}.zip" ./
    # Removing the "nzp" Folder to avoid unlikely, but possible Issues or to just save Space if future Updates cause duplicate Files due to changes in the Folder Structure.
    # echo -e "\033[31mArchaiclly deleting the entire "nzp" Folder to avoid possible Issues with future Updates...\033[31m"
    # rm -r ./nzp
    # Unzipping .zip Archive and delete .zip Archive
    unzip -q -o ./"${ZIP}".zip && rm ./"${ZIP}".zip
    # Updating "nzp" with "modifications"
    echo -e "\033[32mAdding Modifications from "modifications"!\033[0m"
    cp -r -f -T ./modifications/ ./nzp
    # Make the Executable Runnable, then run.
    chmod +x ./"${EXE}"
    echo -e "\033[32mStarting NZP.\033[0m"
    ./${EXE}
fi
