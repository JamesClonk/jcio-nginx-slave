#!/bin/bash
set -e
set -u

# usage check
if [ $# -ne 1 ]; then
	echo "usage: $0 <JCIO_HOSTNAME>"
	exit 1
fi

JCIO_HOSTNAME=$1

for file in `ls *.conf.tmpl`; do
	echo "Prepare $file -> ${file%.*}"
	sed "s/%JCIO_HOSTNAME%/${JCIO_HOSTNAME}/g" $file > ${file%.*}
done

cp -v /root/.docker/server-cert.pem .
cp -v /root/.docker/server-key.pem .

docker rmi jcio-nginx-slave || true
docker build -t jcio-nginx-slave .

rm -vf server-cert.pem
rm -vf server-key.pem

exit 0
