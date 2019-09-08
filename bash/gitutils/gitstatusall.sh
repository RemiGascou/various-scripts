#!/bin/bash

gitstatus () {
    MAXLEN=30
    cd $1
    if [ -d ".git" ]; then # Checks if this is a git repository
        # Checks git status
        #FETCH=`git fetch`
        # UNABLE_TO_ACCESS=`$FETCH | wc -l`
        UPTODATE=`git status | grep "Your branch is up to date" | wc -l`
        DIVERGED=`git status | grep "have diverged" | wc -l`
        DIVERGED_BRANCH=`git status | grep "have diverged" | awk -F 'and' '{print $2}' | awk -F ' ' '{print $1}' | sed "s/'//g"`
        AHEAD=`git status | grep "Your branch is ahead" | wc -l`
        BEHIND=`git status | grep "Your branch is behind" | wc -l`

        # Gets the folder name
        BASENAME=`basename $1`

        if [[ $UPTODATE -eq '1' ]]; then
            printf "\x1b[1m%-${MAXLEN}s : \x1b[92mUP TO DATE\x1b[0m\n" ${BASENAME::${MAXLEN}}
        else
            if [[ $DIVERGED -eq '1' ]]; then
                printf "\x1b[1m%-${MAXLEN}s : \x1b[93mDIVERGED with %s\x1b[0m\n" ${BASENAME::${MAXLEN}} $DIVERGED_BRANCH
            else
                if [[ $AHEAD -eq '1' ]]; then
                    printf "\x1b[1m%-${MAXLEN}s : \x1b[93mAHEAD\x1b[0m\n" ${BASENAME::${MAXLEN}}
                else
                    if [[ $BEHIND -eq '1' ]]; then
                        printf "\x1b[1m%-${MAXLEN}s : \x1b[93mBEHIND\x1b[0m\n" ${BASENAME::${MAXLEN}}
                    else
                        printf "\x1b[1m%-${MAXLEN}s : \x1b[91mUNKNOWN\x1b[0m\n" ${BASENAME::${MAXLEN}}
                    fi
                fi
            fi
        fi
        # fi
    fi
    cd ../
}

GIT_PROJECTS_PATH=/home/administrateur/Documents/git_projects

for dir in `find ./ -maxdepth 1 -type d`; do
    # echo -e "\x1b[1m$dir\x1b[0m"
    #cd ${BASEPATH}/${dir:1}
    gitstatus ${GIT_PROJECTS_PATH}/${dir:1}
done
