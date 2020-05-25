package org.jbake.parser;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Parses documents that contain plain CSV data
 *
 * @author Ralf
 */
public class CsvEngine extends MarkupEngine {

	private static final Logger logger = LoggerFactory.getLogger(MarkdownEngine.class);

	@Override
	public void processBody(final ParserContext context) {
		boolean inBody = false;
		List<List<String>> csvValues = new ArrayList<List<String>>();
		for (String line : context.getFileLines()) {
			if (inBody) {
				logger.debug("CSV values: " + line);
				csvValues.add(List.of(line.split(",")));
			}
			if (line.equals(context.getConfig().getHeaderSeparator())) {
				inBody = true;
			}
		}
		context.getDocumentModel().put("csvValues", csvValues);
	}
}