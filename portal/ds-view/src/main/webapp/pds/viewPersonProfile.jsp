<%
String pdshome = "";
pdshome = application.getInitParameter("pdshome.url");
%>
<html>
<head>
        <title>PDS Person Profile</title>
        <META  NAME="keywords"  CONTENT="Planetary Data System">

        <META  NAME="description" CONTENT="This website serves as a mechanism for displaying
 the PDS user information.">
<link href="<%=pdshome%>css/pds_style.css" rel="stylesheet" type="text/css">
<%@ page language="java" session="true" isThreadSafe="true" info="PDS Search" isErrorPage="false" contentType="text/html; charset=ISO-8859-1" 
import="jpl.eda.xmlquery.*, jpl.eda.profile.*, jpl.eda.profile.ProfileElement, java.util.*, java.net.*, java.io.*, java.net.URLDecoder"
%>

<SCRIPT LANGUAGE="JavaScript">
<%@ include file="/pds/utils.js"%>
</SCRIPT>

</head>

<%!
  /**
   * Null out the parameter value if any of the bad characters are present
   * that facilitate Cross-Site Scripting and Blind SQL Injection.
   */
  public String cleanParam(String str) {
    char badChars [] = {'|', ';', '$', '@', '\'', '"', '<', '>', '(', ')', ',', '\\', /* CR */ '\r' , /* LF */ '\n' , /* Backspace */ '\b'};
    String decodedStr = null;

    if (str != null) {
      decodedStr = URLDecoder.decode(str);
      for(int i = 0; i < badChars.length; i++) {
        if (decodedStr.indexOf(badChars[i]) >= 0) {
          return null;
        }
      }
    }
    return decodedStr;
  }
%>

<body BGCOLOR="#000000">

<%
String[] displayedElements = {"PDS_USER_ID", "FULL_NAME",
                "TELEPHONE_NUMBER", "INSTITUTION_NAME",
                "NODE_ID",
                //"RESLOCATION", 
                "ELECTRONIC_MAIL_ID"};
String pdsUserId = null;

ProfileClient profileClient = new ProfileClient("urn:eda:rmi:JPL.PDS.Person");

%>

<table align="center" bgColor="#FFFFFF" BORDER="0" CELLPADDING="10" CELLSPACING="0">
  <tr>
    <td>
      <%@ include file="/pds/pds_header.html" %>

<%
if (cleanParam(request.getParameter("PDS_USER_ID"))==null) {
%>
     <table width="760" border="0" cellspacing="3" cellpadding="2">
        <tr valign="TOP">
                <td valign="TOP" colspan="2" class="pageTitle">
                        <br><FONT color="#6F4D0E"><b>Person Information</b>
                            </font><br><br>
                </td>
        </tr>

        <tr valign="TOP">
                <td bgcolor="#F0EFEF" width=200 valign=top>
                Please specify a valid PDS_USER_ID
                </td>
        </tr>

      </table>
<%
}
else {

   pdsUserId=request.getParameter("PDS_USER_ID");

   pdsUserId = pdsUserId.toUpperCase();
   XMLQuery xml_query = new XMLQuery(
         /*keywordQuery*/"PDS_USER_ID=\"" + pdsUserId + "\"",
         /*id*/"OODT_XML_QUERY_V0.1",
         /*title*/"OODT_XML_QUERY - Bean Query", 
			/*desc*/"This query can be handled by the OODT System",
         /*ddId*/null,
			/*resultModeId*/"profile",
			/*propType*/"BROADCAST",
			/*propLevels*/"N/A",
         XMLQuery.DEFAULT_MAX_RESULTS);

    List profile = profileClient.query(xml_query);

    // if invalid value specified
    if (profile.size() < 1)  { %>
     <table width="760" border="0" cellspacing="3" cellpadding="2">
        <tr valign="TOP">
                <td valign="TOP" colspan="2" class="pageTitle">
                        <br><FONT color="#6F4D0E"><b>Person Information</b>
                            </font><br><br>
                </td>
        </tr>
            
        <tr valign="TOP">
                <td bgcolor="#F0EFEF" width=200 valign=top>
                <b><%=pdsUserId%></b> is not a valid PDS User ID. 
                </td>
        </tr>

      </table>
<%
    } else { 
      // we get back only 1 profile
      Map elements = ((Profile)profile.get(0)).getProfileElements(); 
%>

      <table width="760" border="0" cellspacing="3" cellpadding="2">
        <tr valign="TOP">
                <td valign="TOP" colspan="2" class="pageTitle">
                        <br><FONT color="#6F4D0E"><b>Person Information</b></font><br><br>
                </td>
        </tr>
      <% for (int i=0; i<displayedElements.length; i++) {
             if (elements.containsKey(displayedElements[i])) { 
                ProfileElement pe = (ProfileElement)elements.get(displayedElements[i]); %>
               <TR>
                 <td bgcolor="#F0EFEF" width=200 valign=top><%=displayedElements[i]%></td> 
                 <td bgcolor="#F0EFEF" valign=top>
                   
             <% for (Iterator e = pe.getValues().iterator(); e.hasNext();) {
                  String val = (String)e.next();
                  val = val.replaceAll("\n","<br>");			
                  if (val.startsWith("http://") || val.startsWith("HTTP://")) { %>
                      <a href="<%=val%>" target="_blank"><%=val%></a>
             <%   } else { %>
                      <%=val%><br>
             <%   }
                } %>

                </td>
               </TR>
         <%
             } else { // this element does not have a value %>
               <TR>
                  <td bgcolor="#F0EFEF" width=200 valign=top><%=displayedElements[i]%></td>
                  <td bgcolor="#F0EFEF"></td>
               </TR>
         <%  }
         } // for loop
     } // if pds user id is valid

} // if PDS_USER_ID is specified

         %>
        <%@ include file="/pds/footer.html" %>
        </table>

    </td>
  </tr>
</TABLE>

</BODY>
</HTML>
