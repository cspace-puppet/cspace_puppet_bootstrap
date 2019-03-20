#!/bin//bash

BASE=$(pwd)
BRANCH=${1}
NEW_BRANCH=$2

if [ -z "$BRANCH" ]; then
  echo "Branch argument required."
  exit 1
fi

mkdir -p $BASE/src/

declare -a arr=(
  "cspace_environment"
  "cspace_hiera_config"
  "cspace_java"
  "cspace_postgresql_server"
  "cspace_server_dependencies"
  "cspace_source"
  "cspace_tarball"
  "cspace_user"
  "puppet"
)

for i in "${arr[@]}"
do
  echo "Downloading: $i"
  git clone git@github.com:cspace-puppet/$i.git ${BASE}/src/${i} || true
  cd ${BASE}/src/${i}

  git fetch --all
  git checkout $BRANCH
  git pull origin $BRANCH

  if [ -n "$NEW_BRANCH" ]; then
    git checkout -b $NEW_BRANCH
    git push origin $NEW_BRANCH
  fi
  printf "\n"
done
