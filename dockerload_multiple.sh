#!/bin/sh
for f in *.tar; do
    cat $f | docker load
done
