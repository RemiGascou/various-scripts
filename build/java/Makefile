MAINCLASSNAME=EX_00

all : clean build run

clean:
	if [ `ls -1 *.class | wc -l` != 0 ]; then
	    echo -e "\x1b[1m[\x1b[93mCLEANUP\x1b[0m\x1b[1m]\x1b[0m rm *.class"
	    rm *.class
	fi

build :
	VAREXISTSJAVAFILES=`ls -p *.java | grep -v / | wc -l`
	if [ ${VAREXISTSJAVAFILES} != 0 ] && [ -f "${MAINCLASSNAME}.java" ]; then
	    echo -e "\x1b[1m[\x1b[93m BUILD \x1b[0m\x1b[1m]\x1b[0m javac ${MAINCLASSNAME}.java"
	    javac ${MAINCLASSNAME}.java
	else
	    echo -e "\x1b[1m[\x1b[93m BUILD \x1b[0m\x1b[1m]\x1b[0m Cannot find file ${MAINCLASSNAME}.java"
	fi

run:
    echo -e "\x1b[1m[\x1b[93mRUNNING\x1b[0m\x1b[1m]\x1b[0m java ${MAINCLASSNAME}"
    java ${MAINCLASSNAME}
