#! /bin/bash

# save current directory
MY_DIR=$(pwd)

# empty staging directories
rm ~/staging/exercise1/*
rmdir ~/staging/exercise1
rmdir ~/staging


#copy the files to hdfs
hdfs dfs -rm /user/w205/hospital_compare/hospitals/geninfo.csv
hdfs dfs -rm /user/w205/hospital_compare/hvbp/hvbp.csv
hdfs dfs -rm /user/w205/hospital_compare/measuredates/measuredates.csv
hdfs dfs -rm /user/w205/hospital_compare/readmit/readmit.csv
hdfs dfs -rm /user/w205/hospital_compare/timely/timely.csv

#rm our hdfs directory
hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/hvbp
hdfs dfs -rmdir /user/w205/hospital_compare/measuredates
hdfs dfs -rmdir /user/w205/hospital_compare/readmit
hdfs dfs -rmdir /user/w205/hospital_compare/timely

hdfs dfs -rmdir /user/w205/hospital_compare

#change directory back to original
cd $MY_DIR

#clean exit
exit
