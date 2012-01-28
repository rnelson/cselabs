#include <stdio.h>
#include <string.h>
#include <curl/curl.h>

int send_query_(char*);

int send_query_(char *url) {
	CURL *curl;
	CURLcode res;
	char err[CURL_ERROR_SIZE];
	
	curl = curl_easy_init();
	
	if (curl) {
		curl_easy_setopt(curl, CURLOPT_URL, url);
		curl_easy_setopt(curl, CURLOPT_ERRORBUFFER, err);
		
		res = curl_easy_perform(curl);
		
		if (res != 0) {
			fprintf(stderr, "There was an error: %s\n", err);
		}
		
		curl_easy_cleanup(curl);
	}
	
	return res;
}
