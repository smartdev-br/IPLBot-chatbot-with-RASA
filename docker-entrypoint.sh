#!/bin/bash
set -e

if [ "$1" = '--help' ]; then
    echo "** comece com os comandos"
    echo "make train-nlu"
    echo "make train-core"
    echo "make action-server &"
    echo "make cmdline"
fi

