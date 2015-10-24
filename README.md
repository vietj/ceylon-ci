# Ceylon daily build

Builds every day:

- Ceylon distrib
- Ceylon SDK
- Ceylon IDE plugin

## Build status

[![Build Status](https://vietj.ci.cloudbees.com/buildStatus/icon?job=ceylon-daily)](https://vietj.ci.cloudbees.com/job/ceylon-daily/)

## Usage

### Ceylon dist

That's the base Ceylon distrib

Unpack https://vietj.ci.cloudbees.com/job/ceylon-daily/lastSuccessfulBuild/artifact/build/ceylon-dist.tgz somewhere and add the unpacked
bin directory to your path

### Ceylon repository

Normally these are downloaded from a repository, however there is no repository for the master, so you need
to unpack the repo in your `~/.ceylon/repo` directory.

Unpack https://vietj.ci.cloudbees.com/job/ceylon-daily/lastSuccessfulBuild/artifact/build/repo.tgz in `~/.ceylon/repo` directly

### Ceylon Eclipse IDE plugin

Unpack https://vietj.ci.cloudbees.com/job/ceylon-daily/lastSuccessfulBuild/artifact/build/eclipse-site.tgz somewhere and use this directory
as Eclipse update source, it provides the Ceylon plugin.

## Building yourself

Prerequisites

- `Ant`, `Maven` available in your path
- a Java 7 distribution

```
> sh build.sh
```
