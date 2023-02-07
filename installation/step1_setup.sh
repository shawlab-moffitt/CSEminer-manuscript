# for mac

# downloading the jar files 
sh download_drppm_jars.sh

# downloading the reference files
sh download_mac.sh

cd input_and_references/
# unpacking all the downloaded files
sh ../unpack.sh

cd ../

sh generate_param_files.sh
