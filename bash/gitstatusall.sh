#!/bin/bash

gitstatus () {
    cd $1
    if [ -d ".git" ]; then # Checks if this is a git repository
        # Checks git status
        #FETCH=`git fetch`
        UNABLE_TO_ACCESS=`$FETCH | wc -l`

        UPTODATE=`git status | grep "Your branch is up to date" | wc -l`
        AHEAD=`git status | grep "Your branch is ahead" | wc -l`
        BEHIND=`git status | grep "Your branch is behind" | wc -l`
        # Gets the folder name
        BASENAME=`basename $1`
        # Prints result
        if [[ $UNABLE_TO_ACCESS -eq '1' ]]; then
            printf "\x1b[1m%-30s : \x1b[91mUNABLE TO FETCH\x1b[0m\n" ${BASENAME::30}
        else
            if [[ $UPTODATE -eq '1' ]]; then
                printf "\x1b[1m%-30s : \x1b[92mUP TO DATE\x1b[0m\n" ${BASENAME::30}
            else
                if [[ $AHEAD -eq '1' ]]; then
                    printf "\x1b[1m%-30s : \x1b[93mAHEAD\x1b[0m\n" ${BASENAME::30}
                else
                    if [[ $BEHIND -eq '1' ]]; then
                        printf "\x1b[1m%-30s : \x1b[93mBEHIND\x1b[0m\n" ${BASENAME::30}
                    else
                        printf "\x1b[1m%-30s : \x1b[91mUNKNOWN\x1b[0m\n" ${BASENAME::30}
                    fi
                fi
            fi
        fi
    fi
    cd ../
}

GIT_PROJECTS_PATH=/home/administrateur/Documents/git_projects

for dir in `find ./ -maxdepth 1 -type d`; do
    # echo -e "\x1b[1m$dir\x1b[0m"
    #cd ${BASEPATH}/${dir:1}
    gitstatus ${GIT_PROJECTS_PATH}/${dir:1}
done
