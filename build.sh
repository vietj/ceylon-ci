CEYLON_PATH=`pwd`/ceylon-dist/dist/bin

if [ -f eclipse.tgz ];
then
    echo "Eclipse already downloaded"
else
    echo "Downloading Eclipse"
    curl -o eclipse.tgz --remote-name http://mirrors.ibiblio.org/eclipse/technology/epp/downloads/release/kepler/SR2/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz
fi
if [ -f eclipse ];
then
    echo "Eclipse already unzipped"
else
    echo "Unzipping Eclipse"
    tar -xvzf eclipse.tgz
fi
$ECLIPSE_PATH=`pwd`/eclipse
PATH=$ECLIPSE_PATH:$PATH
(cd ceylon-dist;ant setup clean publish-all ide-quick)
(cd ceylon-sdk;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH)
(cd ceylon.formatter;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH)
(cd ceylon-ide-common;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH)
(cd ceylon-ide-eclipse;mvn clean install -DskipTests)
