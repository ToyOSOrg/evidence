#!/bin/zsh
# The first sweep (at eb13e2b88) against a census-only prediction: oracle-second/predict.sh over that oracle's
# census and lock listing before the build, then the sysroots its build log says it removed, compared as sets.
F=${0:A:h}
EV=${F:h:h}
O=$EV/build-eb13e2b88/oracle
$F/../oracle-second/predict.sh $O/census-before.txt 24 $O/locks-open-before.txt; echo "predict EXIT=$?"
awk '/^goes/ {print $2}' <($F/../oracle-second/predict.sh $O/census-before.txt 24 $O/locks-open-before.txt) | sort > $F/predicted.txt
grep -o 'Removed sysroot [^:]*' $O/build-fresh-sysroot.log | awk -F/ '{print $NF}' | sort > $F/removed.txt
echo "predicted $(wc -l < $F/predicted.txt | tr -d ' '), removed $(wc -l < $F/removed.txt | tr -d ' ')"
diff $F/predicted.txt $F/removed.txt; echo "diff predicted removed EXIT=$?"
