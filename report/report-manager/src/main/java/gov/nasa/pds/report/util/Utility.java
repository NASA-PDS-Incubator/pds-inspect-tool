//	Copyright 2013, by the California Institute of Technology.
//	ALL RIGHTS RESERVED. United States Government Sponsorship acknowledged.
//	Any commercial use must be negotiated with the Office of Technology 
//	Transfer at the California Institute of Technology.
//	
//	This software is subject to U. S. export control laws and regulations 
//	(22 C.F.R. 120-130 and 15 C.F.R. 730-774). To the extent that the software 
//	is subject to U.S. export control laws and regulations, the recipient has 
//	the responsibility to obtain export licenses or other export authority as 
//	may be required before exporting such information to foreign countries or 
//	providing access to foreign nationals.
//	
//	$Id$
//
package gov.nasa.pds.report.util;

import gov.nasa.pds.report.ReportManagerException;
import gov.nasa.pds.report.constants.Constants;
import gov.nasa.pds.report.logs.LogsManagerException;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Vector;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.LineIterator;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * 
 * @author jpadams
 * @version $Revision$
 *
 */
public class Utility {

	/**
	 * Get the current date time.
	 * 
	 * @return A date time.
	 */
	public static String getDateTime() {
		SimpleDateFormat df = new SimpleDateFormat(
				"EEE, MMM dd yyyy 'at' hh:mm:ss a");
		Date date = Calendar.getInstance().getTime();
		return df.format(date);
	}

	public static String getFileDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date date = Calendar.getInstance().getTime();
		return df.format(date);
	}

	public static List<String> getLocalFileList(String path) {
		File dir = new File(path);
		return Arrays.asList(dir.list());
	}

	public static String getHomeDirectory() {
		if (System.getenv(Constants.HOME_ENV_VAR) != null) {
			return System.getenv(Constants.HOME_ENV_VAR);
		} else {
			return (new File(System.getProperty("java.class.path")))
				.getParentFile().getParent();
		}
	}

	/**
	 * Method to convert the file path to absolute, if relative
	 * 
	 * @param filePath
	 *            Current path given through the command-line
	 * @return the absolute path from the input file path
	 */
	public static String getAbsolutePath(final String filePath) {
		String finalPath = "";
		File tFile = new File(filePath);
		if (!tFile.isAbsolute()) {
			finalPath = System.getProperty("user.dir") + "/" + filePath;
		} else {
			finalPath = filePath;
		}

		tFile = new File(finalPath);
		return finalPath;
	}

	public static File replaceStringInFile(String oldStr, String newStr,
			File in, File out) throws IOException {
		StringBuffer buffer = new StringBuffer();
		LineIterator it = FileUtils.lineIterator(in, "UTF-8");
		try {
			while (it.hasNext()) {
				buffer.append(it.nextLine().replaceAll(oldStr, newStr)
						+ System.getProperty("line.separator"));
			}
		} finally {
			it.close();
		}

		BufferedWriter writer = new BufferedWriter(new FileWriter(out));
		writer.write(buffer.toString());
		writer.flush();
		writer.close();

		return out;
	}
	
	/**
	 * Utility method to extract values from an XML file.
	 * 
	 * @param file
	 * @param tagName			name of the tag we are looking for
	 * @param attributeName		if applicable, else set to null
	 * @return
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws IOException
	 */
	public static List<String> getValuesFromXML(File file, String tagName, String attributeName) throws Exception {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document doc = db.parse(file);
		
		List<String> valueList = new ArrayList<String>();
		NodeList nodes = doc.getElementsByTagName(tagName);
		for (int i=0; i<nodes.getLength(); i++) {
			if (attributeName == null) {
				valueList.add(nodes.item(i).getNodeValue());
			} else {
				valueList.add(nodes.item(i).getAttributes().getNamedItem(attributeName).getNodeValue());
			}
		}
		
		return valueList;
	}
	
	/**
	 * Utility method to get a String from a {@link Properties}.
	 * 
	 * @param nodeProps				The Properties containing the desired value
	 * @param key					The key of the desired value
	 * @param needed				Whether the value must be present
	 * @return						The desired value in the form of a String
	 * @throws LogsManagerException	If needed is true and the given key is not present or if the value is null or empty
	 */
	public static String getNodePropsString(Properties nodeProps, String key,
			boolean needed) throws ReportManagerException{
		
		String nodeName = null;
		if(key == null || key.equals("")){
			throw new ReportManagerException("Cannot fetch String value of " +
					"null key from node properties.");
		}
		if(!key.equals(Constants.NODE_ID_KEY)){
			nodeName = getNodePropsString(nodeProps,
					Constants.NODE_ID_KEY, false);
		}
		if(!nodeProps.containsKey(key)){
			if(needed){
				if(nodeName != null){
					throw new ReportManagerException(key +
							" value does not exist for node " + nodeName);
				}else{
					throw new ReportManagerException(key +
							" value does not exist for unnamed node:\n" +
							nodeProps.toString());
				}
			}else{
				return null;
			}
		}
		String info = nodeProps.getProperty(key);
		if(needed && (info == null || info.equals(""))){
			if(nodeName != null){
				throw new ReportManagerException(key +
						" value is empty for node " + nodeName);
			}else{
				throw new ReportManagerException(key +
						" value is empty for unnamed node:\n" +
						nodeProps.toString());
			}
		}
		return info.trim();
		
	}
	
	/**
	 * Utility method to get a boolean from a {@link Properties}.
	 * 
	 * @param nodeProps					The Properties containing the desired
	 * 									value
	 * @param key						The key of the desired value
	 * @return							The desired value in the form of a
	 * 									boolean
	 * @throws ReportManagerException	If the given key is not present or if
	 * 									the value is null or empty
	 */
	public static boolean getNodePropsBool(Properties nodeProps, String key)
			throws ReportManagerException{
		
		if(key == null || key.equals("")){
			throw new ReportManagerException("Cannot fetch boolean value of " +
					"null key from node properties.");
		}
		String nodeName = getNodePropsString(nodeProps,
				Constants.NODE_ID_KEY, false);
		if(!nodeProps.containsKey(key)){
			if(nodeName != null){
				throw new ReportManagerException(key +
						" value does not exist for node " + nodeName);
			}else{
				throw new ReportManagerException(key +
						" value does not exist for unnamed node:\n" +
						nodeProps.toString());
			}
		}
		String infoStr = nodeProps.getProperty(key);
		if(infoStr == null || infoStr.equals("")){
			if(nodeName != null){
				throw new ReportManagerException(key +
						" value is empty for node " + nodeName);
			}else{
				throw new ReportManagerException(key +
						" value is empty for unnamed node:\n" +
						nodeProps.toString());
			}
		}
		return Boolean.valueOf(infoStr);
		
	}
	
	/**
	 * Remove the filename/expression from the pathname and return base path
	 * 
	 * @param	pathname
	 * @return	A String of the path of the directory containing the file
	 */
	public static String getDirPath(String pathname) {
		
		return pathname.substring(0, pathname.lastIndexOf("/"));
	
	}
	
	/**
	 * Get the number of times that a substring occurs in a String
	 * 
	 * @param haystack	The string to search through
	 * @param needle	The substring to for which we search
	 * @return			The number of times that the substring occurs within
	 * 					the String
	 */
	public static int countSubstringInstances(String haystack, String needle){
		
		return haystack.length() - haystack.replace(needle, "").length();
		
	}
	
	/**
	 * Get a {@link List} of {@link File}s in the given directory.
	 * 
	 * @param dir	A {@link File} object indicating the directory in question.
	 * @return		A List of Files in the provided directory.
	 */
	public static List<File> getFileList(File dir) throws ReportManagerException{
		
		if(dir == null){
			throw new ReportManagerException("Can't request a file list " +
					"from a null directory.");
		}else if(!dir.exists()){
			throw new ReportManagerException("Can't request a file list " +
					"from a non-existant directory.");
		}else if(!dir.isDirectory()){
			throw new ReportManagerException("Can't request a file list " +
					"from a non-directory.");
		}
		
		String[] filenames = dir.list();
		// TODO: Remove this code if it turns out that we don't need it
//		if(filenames == null || filenames.length == 0){
//			throw new ReportManagerException("No files found in directory " +
//					dir.getAbsolutePath());
//		}
		List<File> files = new Vector<File>();
		for(String filename: filenames){
			files.add(new File(dir, filename));
		}
		return files;
		
	}
	
}
