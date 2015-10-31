import java.net.URL;
import de.l3s.boilerpipe.BoilerpipeProcessingException;
import de.l3s.boilerpipe.extractors.ArticleExtractor;
import de.l3s.boilerpipe.extractors.ArticleSentencesExtractor;

public class BoilerPlateRemovalObject {
	private URL url;
	private String ExtractedString;

	
	public BoilerPlateRemovalObject(URL url) {
		this.url = url;
		this.ExtractedString = "";
	}
	
	private URL getUrl(URL url) {
		return this.url;
	}
	
	public String getExtractedString() {
		return this.ExtractedString;
	}
	
	// A full-text extractor which is tuned towards news articles
	public void removeBoilerplate() throws BoilerpipeProcessingException {
		String extractedText = ArticleExtractor.INSTANCE.getText(this.url);
		this.ExtractedString = extractedText;
	}
	
	public void extractSentences() throws BoilerpipeProcessingException {
		String extractedSentences = ArticleSentencesExtractor.INSTANCE.getText(this.url);
		this.ExtractedString = extractedSentences;
	}
	
}
