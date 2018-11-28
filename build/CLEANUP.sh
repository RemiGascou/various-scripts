PROJECTPATH=POO_TP_01/src/

cd ${PROJECTPATH}

for ex in `ls -d */`; do
    cd $ex/
    if [ `ls -1 | grep .class | wc -l` != 0 ]; then
        echo "[CLEANUP] Found `ls -1 | grep .class | wc -l` *.class files to cleanup in $ex/ "
        rm *.class
    fi
    cd ../
done


echo "[CLEANUP] Done."
