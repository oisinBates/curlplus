#!/usr/bin/env bash

#This script allows the user to send multiple curl requests, either to a single site or to multiple sites(via a file listing desired sites)
count_200_repsonse=0
connection_times=0
start_time=`date +"%s.%3N"`


function single_site_curl {
	for i in $(seq 1 "$1");do

		request=$(curl -s -o /dev/null --write-out "Response code:%{http_code} Download Size:%{size_download} Connect time:%{time_connect} Total time:%{time_total}" "$2")

		printf "\n test no.$i \n $request"

		#parse http_code
		startIndex=$(expr index "$request" ':')
		request=${request:$startIndex}
		endIndex=$(expr index "$request" ' ')
		endIndex=$((endIndex -1))
		response_code=${request:0:endIndex}
		if [ "$response_code" == "200" ]; then
			count_200_repsonse=$((count_200_repsonse + 1))
		fi

		#parse size_download
		startIndex=$(expr index "$request" ':')
		request=${request:$startIndex}
		endIndex=$(expr index "$request" ' ')
		download_size=${request:0:endIndex}
		download_sum=$((download_sum + download_size))

		#parse connection_time
		startIndex=$(expr index "$request" ':')
		request=${request:$startIndex}
		endIndex=$(expr index "$request" ' ')
		connection_time=${request:0:endIndex}
		connection_times=$(bc <<< "$connection_times+$connection_time")

	done

	test_count="$i"
}

function multi_site_curl {
	test_count=0
	while read website; do
		test_count=$((test_count + 1))

		request=`curl -s -o /dev/null --write-out "Response code:%{http_code} Download Size:%{size_download} Connect time:%{time_connect} Total time:%{time_total}" "$website"`
		printf "test no.${test_count} \n curl sending get request for ${website} \n ${request}\n\n"

		#parse http_code
		startIndex=$(expr index "$request" ':')
		request=${request:$startIndex}
		endIndex=$(expr index "$request" ' ')
		endIndex=$((endIndex -1))
		response_code=${request:0:endIndex}
		if [ "$response_code" == "200" ]; then
			count_200_repsonse=$((count_200_repsonse + 1))
		fi

		#parse size_download
		startIndex=$(expr index "$request" ':')
		request=${request:$startIndex}
		endIndex=$(expr index "$request" ' ')
		download_size=${request:0:endIndex}
		download_sum=$((download_sum + download_size))

		#parse connection_time
		startIndex=$(expr index "$request" ':')
		request=${request:$startIndex}
		endIndex=$(expr index "$request" ' ')
		connection_time=${request:0:endIndex}
		connection_times=$(bc <<< "$connection_times+$connection_time")
	done <$1

	# test_count=$(cat "$1" | wc -l)

}

#regular expression to check that first parameter is an integer
reg_ex_integer='^[0-9]+$'
reg_ex_txt_file='^(.{1,250})\.txt?$'

#check that parameters match regular expressions. Print error and exit script if a parameter doesn't match.
# if [[ ${1} =~ $reg_ex_integer ]] ; then
if [[ "${1}" =~ ${reg_ex_integer} ]] ; then
		single_site_curl $1 $2
# elif [[ $1 =~ $reg_ex_txt_file ]] ; then
elif [[ "${1}" =~ ${reg_ex_txt_file} ]] ; then
	multi_site_curl $1
elif [ "${1}" = "--help" ] ; then
	printf "\nUsage: curlplus [number of requests/source file] [url{if no source file}] \n\nThis script allows the user to send multiple curl requests, either to a single site or to multiple sites(via a file listing desired sites)"  >&2; exit 1
	#potentially replace this with a 'getopts' solution http://stackoverflow.com/questions/5474732/how-can-i-add-a-help-method-to-a-shell-script
else
	echo "Invalid parameters. Please see 'curlplus --help' for correct syntax"  >&2; exit 1
fi


# print overall test results
printf "\n\n overall test results \n\n"
end_time=`date +"%s.%3N"`
duration_millis=`bc <<< "$end_time-$start_time"`
unsuccsessful_transactions=`expr $test_count - $count_200_repsonse`
average_connection_time=`bc <<< "scale=6; $connection_times/$test_count"`

echo overall_test_duration: $duration_millis
echo number_of_tests: $test_count
echo 200_status_count: $count_200_repsonse
echo unsuccsessful_transactions: $unsuccsessful_transactions
echo average_connection_time: $average_connection_time
echo download_sum: $download_sum bytes
