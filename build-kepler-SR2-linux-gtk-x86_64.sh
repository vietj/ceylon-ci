if [ -f eclipse.tgz ];
then
    echo "Eclipse already downloaded"
else
    echo "Downloading Eclipse"
    curl -s -o eclipse.tgz --remote-name http://mirrors.ibiblio.org/eclipse/technology/epp/downloads/release/kepler/SR2/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz
fi
if [ -f eclipse ];
then
    echo "Eclipse already unzipped"
else
    echo "Unzipping Eclipse"
    tar -xvzf eclipse.tgz
fi
ECLIPSE_PATH=`pwd`/eclipse
PATH=$ECLIPSE_PATH:$PATH
sh ./build.sh