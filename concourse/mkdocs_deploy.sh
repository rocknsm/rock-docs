#!/bin/bash

# export LC_ALL=C.UTF-8
# export LANG=C.UTF-8
yum update -y
yum install -y python36u-pip
pip3 install 'pymdown-extensions<5.0' 'Markdown<3.0' 'mkdocs<1.0' 'mkdocs-material<3.0'

cd rock-docs-git
mkdocs gh-deploy
