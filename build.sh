#!/bin/bash
set -e

# Clone repos
git clone --depth 1 https://github.com/ceylon/ceylon.git
git clone --depth 1 https://github.com/ceylon/ceylon-sdk.git
git clone --depth 1 https://github.com/ceylon/ceylon.formatter.git
git clone --depth 1 https://github.com/ceylon/ceylon-ide-common.git
git clone --depth 1 https://github.com/ceylon/ceylon.tool.converter.java2ceylon.git
git clone --depth 1 https://github.com/ceylon/ceylon-ide-eclipse.git

# Ceylon repo
CEYLON_REPO=`pwd`/repo
rm -rf $CEYLON_REPO
mkdir $CEYLON_REPO

# Ceylon config
if [ ! -d ".ceylon" ];
then
    mkdir ".ceylon"
fi
printf '%s\n%s\n' '[repository "USER"]' "url=$CEYLON_REPO" >.ceylon/config

# Build
CEYLON_PATH=`pwd`/ceylon/dist/bin
(cd ceylon/dist;ant clean publish ide-quick)
(cd ceylon-sdk;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH -Dceylon.repo.dir=$CEYLON_REPO)
(cd ceylon.formatter;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH -Dceylon.repo.dir=$CEYLON_REPO)
(cd ceylon-ide-common;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH -Dceylon.repo.dir=$CEYLON_REPO)
(cd ceylon.tool.converter.java2ceylon;ant clean publish ide-quick -Ddist.bin.dir=$CEYLON_PATH -Dceylon.repo.dir=$CEYLON_REPO)
(cd ceylon-ide-eclipse;mvn clean install -DskipTests)

# Package
BUILD_DIR=`pwd`/build
rm -rf $BUILD_DIR
mkdir $BUILD_DIR
mkdir $BUILD_DIR/ceylon
cp -r ceylon/dist/dist/* $BUILD_DIR/ceylon
mkdir $BUILD_DIR/eclipse-site
cp -r ceylon-ide-eclipse/site/target/repository $BUILD_DIR/eclipse-site
(cd build;tar -cvzf $BUILD_DIR/ceylon-dist.tgz ceylon)
(cd repo;tar -cvzf $BUILD_DIR/repo.tgz *)
(cd build;tar -cvzf $BUILD_DIR/eclipse-site.tgz eclipse-site)
