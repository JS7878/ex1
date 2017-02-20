# Save current directory
MY_DIR=$(pwd)

# create staging directories
mkdir ~/staging
mkdir ~/staging/exercise1

#change to staging directory
cd ~/staging/exercise1

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

wget "$MY_URL" -O medicare_data.zip

# unzip the medicare data
unzip medicare_data.zip

#remove first line of files and rename
tail -n +2 "Hospital General Information.csv" > geninfo.csv
tail -n +2 "hvbp_hcahps_11_10_2016.csv" > hvbp.csv
tail -n +2 "Measure Dates.csv" > measuredates.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmit.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > timely.csv

#create our hdfs directory
hdfs dfs -mkdir /user/w205/hospital_compare

#copy the files to hdfs
hdfs dfs -put geninfo.csv /user/w205/hospital_compare
hdfs dfs -put hvbp.csv /user/w205/hospital_compare
hdfs dfs -put measuredates.csv /user/w205/hospital_compare
hdfs dfs -put readmit.csv /user/w205/hospital_compare
hdfs dfs -put timely.csv /user/w205/hospital_compare

#change directory back to original
cd $MY_DIR

#clean exit
exit



