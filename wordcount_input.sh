#!/usr/bin/env bash

# Make the HDFS directories
hdfs dfs -mkdir -p /user/hadoop/wordcount/input

# Create the input files
echo "Hello World Bye World" | hdfs dfs -put - wordcount/input/file01
echo "Hello HBase Goodbye HBase" | hdfs dfs -put - wordcount/input/file02

hdfs dfs -cat wordcount/input/*
