//<![CDATA[
google.load('search', '1');
var MAX_URL_DISPLAY_LENGTH = 60

function searchComplete() {
	var contentDiv = document.getElementById('content');
	var countDiv = document.getElementById('resultCount');
	var resultsDiv = document.getElementById('results');
	
	countDiv.className = 'results-count';
					
	if (!search.results || search.results.length == 0) {
		countDiv .innerHTML = 'No results found.';
	}
	else {
		countDiv .innerHTML = 'Found <strong>' + search.results.length.toString() + '</strong> (of up to 8) results for <span id="searchTerms">' + document.getElementById('query').innerText + '</span>.';
		
		var count = search.results.length;
		for (var i = 0; i < count; i++) {
			// Get the result we're working with
			var result = search.results[i];
			
			// Grab the useful result values
			var title = result.titleNoFormatting;
			var url = result.unescapedUrl;
			var cacheUrl = result.cacheUrl;
			var text = result.content;
			
			// If the URL's really big, we'll truncate it for display
			var displayUrl = url;
			if (url.length > MAX_URL_DISPLAY_LENGTH) {
				displayUrl = url.substring(0, (MAX_URL_DISPLAY_LENGTH - 3)) + '...';
			}
			
			// Create all of the HTML nodes we need
			var resultDiv = document.createElement('div');
			var resultTitle = document.createElement('div');
			var resultContent = document.createElement('div');
			var resultText = document.createElement('div');
			var resultUrls = document.createElement('div');
			var resultUrlPlain = document.createElement('span');
			var resultUrlCache = document.createElement('span');
			
			// Populate the new nodes
			resultTitle.innerHTML = title;
			resultText.innerHTML = text;
			resultUrlPlain.innerHTML = '<a href="' + url + '">' + displayUrl + '</a>';
			resultUrlCache.innerHTML = ' <a href="' + cacheUrl + '">Cache</a>';
			
			// Set styles on all of the nodes
			resultDiv.className = 'result';
			resultTitle.className = 'result-title';
			resultContent.className = 'result-content';
			resultText.className = 'result-text';
			resultUrls.className = 'result-urls';
			resultUrlPlain.className = 'result-url';
			resultUrlCache.className = 'result-url, tinytext';
			
			// Put everything together and add it to the result set
			resultUrls.appendChild(resultUrlPlain);
			resultUrls.appendChild(resultUrlCache);
			
			resultContent.appendChild(resultText);
			resultContent.appendChild(resultUrls);
			
			resultDiv.appendChild(resultTitle);
			resultDiv.appendChild(resultContent);
			
			resultsDiv.appendChild(resultDiv);
		}
	}
}

function onLoad() {
	// Send the search query
	search = new google.search.WebSearch();
	search.setResultSetSize(google.search.Search.LARGE_RESULTSET);
	search.setSearchCompleteCallback(this, searchComplete, null);
	search.execute(document.getElementById('query').innerText);
	
	// Hide the query div
	var queryDiv = document.getElementById('query');
	queryDiv.className = 'hide';
	
	// Check for a saved query
	var headerDiv = document.getElementById('header');
	var createdNameSpan = document.getElementById('created_name');
	
	if (createdNameSpan.innerHTML == '') {
		headerDiv.className = 'hide';
	}
}

google.setOnLoadCallback(onLoad);
