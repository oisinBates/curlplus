# curlplus

This script allows the user to run a series of curl commands single or multiple urls.<br>
The user can choose to either run the script on a single url or a list of urls.

### Example Usage
```bash
./curlplus.sh urllist.txt
```

```bash
./curlplus.sh 1 127.0.0.1:4000/bash/2017/05/19/curlplus-project.html
```
### Example Output
```bash
oisin@oisin-ThinkPad-T430:~/curlplus$ ./curlplus.sh urllist.txt 
test no.1 
 curl sending get request for http://127.0.0.1:4000/ 
 Response code:200 Download Size:15457 Connect time:0.000 Total time:0.002

test no.2 
 curl sending get request for http://127.0.0.1:4000/python/2016/08/18/collating-and-graphing-olympic-data-with-pandas-and-bokeh.html 
 Response code:200 Download Size:10436 Connect time:0.000 Total time:0.002

test no.3 
 curl sending get request for http://127.0.0.1:4000/python/2016/07/26/james-joyce-twitter-bot.html 
 Response code:200 Download Size:10565 Connect time:0.000 Total time:0.002

test no.4 
 curl sending get request for http://127.0.0.1:4000/node.js/2016/07/20/maintaining-state-in-an-AWS-Lambda-function.html 
 Response code:200 Download Size:9512 Connect time:0.000 Total time:0.002

test no.5 
 curl sending get request for http://127.0.0.1:4000/node.js/2016/07/17/twilio-homer-simpson-autodialer.html 
 Response code:200 Download Size:9449 Connect time:0.000 Total time:0.002

test no.6 
 curl sending get request for http://127.0.0.1:4000/bash/2016/07/10/bash-media-project.html 
 Response code:200 Download Size:9940 Connect time:0.000 Total time:0.003

test no.7 
 curl sending get request for http://127.0.0.1:4000/android/2016/05/17/android-college-project.html 
 Response code:200 Download Size:9166 Connect time:0.000 Total time:0.002

test no.8 
 curl sending get request for http://127.0.0.1:4000/java/2016/05/10/java-college-project.html 
 Response code:200 Download Size:10570 Connect time:0.000 Total time:0.002



 overall test results 

overall_test_duration: .119
number_of_tests: 8
200_status_count: 8
unsuccsessful_transactions: 0
average_connection_time: 0
download_sum: 85095 bytes
```
