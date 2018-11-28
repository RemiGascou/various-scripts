CLEANUPOPTION=0
BUILDOPTION=1
RUNOPTION=0
PROJECTPATH=POO_TP_01/src/EX_00/
CLASSNAME=EX_00

cd ${PROJECTPATH}

#CLEANUP
if [ ${CLEANUPOPTION} != 0 ] && [ `ls -1 *.class | wc -l` != 0 ]; then
    echo -e "[CLEANUP] rm *.class"
    rm *.class
fi


#BUILD
if [ "${BUILDOPTION}" -eq 1 ]; then
    VAREXISTSJAVAFILES=`ls -p *.java | grep -v / | wc -l`
    if [ ${VAREXISTSJAVAFILES} != 0 ] && [ -f "${CLASSNAME}.java" ]; then
        echo -e "[ BUILD ] javac ${CLASSNAME}.java"
        javac ${CLASSNAME}.java
    else
        echo -e "[ BUILD ] Cannot find file ${CLASSNAME}.java"
    fi
fi

#RUN
if [ "${RUNOPTION}" -eq 1 ]; then
    echo -e "[RUNNING] java ${CLASSNAME}"
    java ${CLASSNAME}
fi
