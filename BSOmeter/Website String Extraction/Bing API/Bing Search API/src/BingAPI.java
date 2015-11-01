import net.billylieurance.azuresearch.AzureSearchResultSet;
import net.billylieurance.azuresearch.AzureSearchWebQuery;
import net.billylieurance.azuresearch.AzureSearchWebResult;
import java.util.*;

// This uses Azure-bing-search version 2 API to query, results 50 per page

public class BingAPI {
	private HashSet<String> urlList;
	private String query;
	
	public BingAPI(String query) {
		this.query = query;
		this.urlList = new HashSet<String>();
	}
	
	public HashSet<String> getListofUrls() {
		return this.urlList;
	}
	
	public int getNumberOfUrls() {
		return urlList.size();
	}
	public void queryForUrls() {
		AzureSearchWebQuery webQuery = new AzureSearchWebQuery();
		webQuery.setAppid("VyTCrG0V2KQKcZ58J60doAr7OMN3DBL182lr46TpwYw");
		webQuery.setQuery(this.query);
 // The results are paged. You can get 50 results per page max.
        for (int i=1; i<=3 ; i++) {
        	webQuery.setPage(i);
        	webQuery.doQuery();
           AzureSearchResultSet<AzureSearchWebResult> webQueryResults = webQuery.getQueryResult();
           for (AzureSearchWebResult query : webQueryResults) {
        	   System.out.println(query.getUrl());
        	   this.urlList.add(query.getUrl());
           }
        }

	}
}
