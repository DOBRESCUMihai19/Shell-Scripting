#!/bin/bash

#General variable definitions
start_date=$(date +%s)
found=0
no_transcript=0
credentials="log=user_name&pwd=password"
user_and_password="user_name:password"
login_address="http://www.wordpresssite.org/wp-login.php?"
random_address="http://www.random.org/calendar-dates/?num=1&start_day=5&start_month=5&start_year=1970&end_day=23&end_month=2&end_year=2011&mondays=on&tuesdays=on&wednesdays=on&thursdays=on&fridays=on&saturdays=on&sundays=on&display=2&format=html&rnd=new"
random_data_marker="<p style=\"line-height: 1.4em; margin-left: 2em\">"
sed_replacement="s/(.*)([0-9]{4})-([0-9]{2})-([0-9]{2})(.*)/http:\/\/www.wordpresssite.org\/\2\/\3\/\4\//"
not_found_error_message="nothing was found"
not_found_error_message_length="${#not_found_error_message}"
posted_in_message="Posted in"
posted_in_message_length="${#posted_in_message}"
no_transcript_message=">no transcript<"
no_transcript_message_length="${#no_transcript_message}"
found_error_message="Found:"
maximum_number=0
tested_addresses_number=0
maximum_number_no_transcript=0

#File-related variable definitions
root_directory="${PWD}/"
directory="${root_directory}""Files/"
undeletable_directory="${root_directory}""Undeletable_Files/"

cookie_library_file="${directory}""cookie_library_file.txt"
wget_output_file="${directory}""wget_output_file.txt"
random_data_file="${directory}""random_data_file.html"
grepped_random_data_file="${directory}""grepped_random_data_file.txt"
sed_output_file="${directory}""sed_output_file.txt"
curl_output_file="${directory}""curl_output_file.txt"
grepped_curl_output_file="${directory}""grepped_curl_output_file.txt"
not_found_addresses_file="${directory}""not_found_addresses_file.txt"
no_transcript_addresses_file="${directory}""no_transcript_addresses_file.txt"
grepped_curl_output_no_transcript_file="${directory}""grepped_curl_output_no_transcript_file.txt"

maximum_number_file="${undeletable_directory}""maximum_number_file.txt"
maximum_number_no_transcript_file="${undeletable_directory}""maximum_number_no_transcript_file.txt"
output_file="${undeletable_directory}""output_file.txt"

cygwin_starter="/usr/bin/cygstart.exe"
chrome_executable="/cygdrive/c/Program Files (x86)\Google\Chrome\Application\chrome.exe"
tail_grepped_string="The script"

pause_string="Press any key to continue..."

#Instructions: Initializations

#(Re)creating the directory with the utility files.
rm -Rf $directory
mkdir -p $directory

#Logging in the web-site.
curl -s -D $cookie_library_file -d $credentials $login_address

#Creating the directory with the statistical files.
mkdir -p $undeletable_directory
touch $maximum_number_file
touch $maximum_number_no_transcript_file
touch $output_file

#Instructions: Main "while" loop
while [ $found -ne 1 ]
do
    #Downloading the data file containing the random information.
    wget -o $wget_output_file -O $random_data_file $random_address

    grep -e "$random_data_marker" $random_data_file > $grepped_random_data_file
    sed -E $sed_replacement $grepped_random_data_file > $sed_output_file
    tested_address=`cat $sed_output_file`
    curl -s -b $cookie_library_file --user $user_and_password -e $tested_address "${tested_address}""?" > $curl_output_file
    grep "$not_found_error_message" $curl_output_file > $grepped_curl_output_file
    grepped_curl_output_file_size=$(du -b $grepped_curl_output_file | cut -f 1)
    if [[ $grepped_curl_output_file_size -lt $not_found_error_message_length ]]; then
         if [ $no_transcript -ne 0 ]; then
             grep "$posted_in_message" $curl_output_file | grep -v "$no_transcript_message" > $grepped_curl_output_no_transcript_file
             grepped_curl_output_no_transcript_file_size=$(du -b $grepped_curl_output_no_transcript_file | cut -f 1)
             if [ $grepped_curl_output_no_transcript_file_size -gt $posted_in_message_length ]; then
                found=1
             else echo $tested_address >> $no_transcript_addresses_file
             fi
         else found=1
         fi
    else echo $tested_address >> $not_found_addresses_file
    fi
done

#Instructions: Pretty-printing
end_date=$(date +%s)
seconds=$(( $end_date - $start_date ))
hours=$((seconds / 3600))
seconds=$((seconds % 3600))
minutes=$((seconds / 60))
seconds=$((seconds % 60))

echo "_____________________________________________________________________" >> $output_file

echo "The script has run for ""${hours}"" hours, ""${minutes}"" minutes, and ""${seconds}"" seconds." >> $output_file

if [ -f $not_found_addresses_file ]; then
    tested_addresses_number=$(wc -l $not_found_addresses_file | cut -f 1 -d " ")
    echo "It has tested ""${tested_addresses_number}"" addresses." >> $output_file

    if [ -f $maximum_number_file ]; then
        maximum_number=`cat $maximum_number_file`
    fi

    if [[ $tested_addresses_number -gt $maximum_number ]]; then
        echo $tested_addresses_number > $maximum_number_file
        echo "And we have a new maximum number of tested addresses: ""${tested_addresses_number}""." >> $output_file
    fi
fi

if [ $no_transcript -ne 0 ]; then
    if [ -f $no_transcript_addresses_file ]; then
        no_transcript_addresses_number=$(wc -l $no_transcript_addresses_file | cut -f 1 -d " ")
        echo "It has found ""${no_transcript_addresses_number}"" addresses with no transcripts." >> $output_file

        if [ -f $maximum_number_no_transcript_file ]; then
            maximum_number_no_transcript=`cat $maximum_number_no_transcript_file`
        fi

        if [ $no_transcript_addresses_number -gt $maximum_number_no_transcript ]; then
            echo $no_transcript_addresses_number > $maximum_number_no_transcript_file
            echo "And we have a new maximum number of tested addresses with no transcript: ""${no_transcript_addresses_number}""." >> $output_file
        fi
    fi
fi

echo "The found address is:" >> $output_file
echo $tested_address >> $output_file

echo "_____________________________________________________________________" >> $output_file

$cygwin_starter "$chrome_executable" $tested_address

tail_length=$(( $(grep -n "$tail_grepped_string" $output_file | tail -1 | cut -f -1 -d ":") - 1))
tail -n +$tail_length $output_file

read -n1 -r -p "$pause_string"

