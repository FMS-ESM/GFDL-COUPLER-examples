#ACCOUNT=Benjei.Tsuang@gaea
ACCOUNT=btsuang@117.103.105.59
DIR="ulm/sit"
if [ 1 -eq 1 ]; then
  rsync -truv  --delete --exclude=*.o* --exclude=*.bak --exclude=*log --exclude=*err --exclude=*out --exclude=*jpg* --exclude=*png* --exclude=tcrg* --exclude=*.nc --exclude=.git* --exclude=exec* ${ACCOUNT}:~/gaea/${DIR} ..
elif [ 1 -eq 1 ]; then
  rsync -truv  --exclude=*log* --exclude=*.o* --exclude=*.bak --exclude=*log --exclude=*err --exclude=*out --exclude=*jpg* --exclude=*png* --exclude=tcrg* --exclude=*.nc --exclude=.git* --exclude=exec* ${ACCOUNT}:~/gaea/${DIR} ..
fi

