#!/usr/bin/env bash

CUR_DIR=$(
  cd $(dirname "$0") || exit 1
  pwd
)

# 颜色输出函数
function echo-red() {
  echo -e "\033[31m$*\033[0m"
}

function echo-green() {
  echo -e "\033[32m$*\033[0m"
}

function echo-yellow() {
  echo -e "\033[33m$*\033[0m"
}

function echo-blue() {
  echo -e "\033[34m$*\033[0m"
}

function echo-purple() {
  echo -e "\033[35m$*\033[0m"
}

function echo-cyan() {
  echo -e "\033[36m$*\033[0m"
}

function echo-white() {
  echo -e "\033[30m$*\033[0m"
}

function help() {
  echo-blue "Usage: ./$0 subcmd: "
  grep "^function" "$0" | cut -d ' ' -f 2 | sed -e 's/()//g'
}

# 下载redis
function download-redis() {
  local cur
  local tmp
  local version="6.2.6"
  if [ $# -ne 0 ]; then
    version="$1"
  fi
  local package=redis-${version}
  local url="https://download.redis.io/releases/${package}.tar.gz"

  cur=$(pwd)
  tmp=$(mktemp -d)
  wget -P "$tmp" "$url"
  cd "$tmp" || exit 1
  tar -zxvf "$package.tar.gz"
  cd "$tmp/$package" || exit 1
  make
  rm -frv "$tmp"
  cd "$cur" || exit 1
}

function main() {
  local cmd=$1
  local rc=0
  shift
  $cmd "$@" || rc=$?
  exit $rc
}

if [[ "$*" ]]; then
  main "$@"
fi
