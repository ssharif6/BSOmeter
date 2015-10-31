import java.net.MalformedURLException;
import java.net.URL;

import de.l3s.boilerpipe.BoilerpipeProcessingException;
import de.l3s.boilerpipe.extractors.ArticleExtractor;

public class BoilerPlateRemovalMain {

	public static void main(String[] args) throws MalformedURLException, BoilerpipeProcessingException {
		// TODO Auto-generated method stub
		URL url = new URL("http://abcnews.go.com/Politics/donald-trump-outlines-plan-reform-veterans-affairs/story?id=34878656");
		BoilerPlateRemovalObject boilerplateRemoval = new BoilerPlateRemovalObject(url);
		boilerplateRemoval.extractSentences();
		System.out.println(boilerplateRemoval.getExtractedString());
	}

}
