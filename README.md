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
oisin@oisin-ThinkPad-T430:~/curlplus$ ./curlplus.sh 1 127.0.0.1:4000/bash/2017/05/19/curlplus-project.html

 test no.1 
 Response code:200 Download Size:8685 Connect time:0.000 Total time:0.004

 overall test results 

overall_test_duration: .091
number_of_tests: 1
200_status_count: 1
unsuccsessful_transactions: 0
average_connection_time: 0
download_sum: 8685 bytes
```
