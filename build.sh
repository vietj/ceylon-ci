CEYLON_PATH=`pwd`/ceylon-dist/dist/bin
(cd ceylon-dist;ant setup clean publish-all ide-quick)
(cd ceylon-sdk;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH)
(cd ceylon.formatter;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH)
(cd ceylon-ide-common;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH)
(cd ceylon-ide-eclipse;mvn clean install -DskipTests)
