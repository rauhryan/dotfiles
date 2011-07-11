#!/bin/bash
DIR=$1
echo $DIR

mkdir $DIR
mkdir $DIR/views
mkdir $DIR/templates
mkdir $DIR/models
mkdir $DIR/collections
mkdir $DIR/controllers
touch $DIR/app.js
