# HBase gradle examples

## Build
``` bash
git clone https://github.com/hibuz/hbase-example

cd hbase-example

# Run and Execute bash on docker container
./docker_up.sh

# Build in the docker container
./mvnw package
```

## Prepare input files into the distributed filesystem
``` bash
# Make the HDFS directories
hdfs dfs -mkdir -p /user/hadoop/wordcount/input

# Create the input files
echo "Hello World Bye World" | hdfs dfs -put - wordcount/input/file01
echo "Hello HBase Goodbye HBase" | hdfs dfs -put - wordcount/input/file02
```

## Run some of the examples provided:
``` bash
# WordCount Example
hadoop jar target/examples-0.0.1-SNAPSHOT.jar wordcount wordcount/input wordcount/output

# View the output files on the distributed filesystem:
hdfs dfs -cat wordcount/output/*

# Result of the output files 
Bye	1
Goodbye	1
HBase	2
Hello	2
World	2

# Grep Example
hadoop jar target/examples-0.0.1-SNAPSHOT.jar grep wordcount/input output '([G-H])\w+'

# View the output files on the distributed filesystem:
hdfs dfs -cat output/*

# Result of the output files 
2	Hello
2	HBase
1	Goodbye
```

## Stops containers and removes containers, networks, and volumes
``` bash
./docker_down.sh -v

[+] Running 3/3
 ⠿ Container hbase                  Removed
 ⠿ Network example_default           Removed
 ⠿ Volume hbase-example_hbase-vol  Removed
 ```
 