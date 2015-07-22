if [ ! -f eclipse.tgz ];
then
    curl -s -o eclipse.tgz --remote-name http://mirrors.ibiblio.org/eclipse/technology/epp/downloads/release/kepler/SR2/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz
fi
ECLIPSE_PATH=`pwd`/eclipse
rm  -rf $ECLIPSE_PATH
tar -xvzf eclipse.tgz
PATH=$ECLIPSE_PATH:$PATH
sh ./build.sh