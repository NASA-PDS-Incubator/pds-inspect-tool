:: Copyright 2011, by the California Institute of Technology.
:: ALL RIGHTS RESERVED. United States Government Sponsorship acknowledged.
:: Any commercial use must be negotiated with the Office of Technology Transfer
:: at the California Institute of Technology.
::
:: This software is subject to U. S. export control laws and regulations
:: (22 C.F.R. 120-130 and 15 C.F.R. 730-774). To the extent that the software
:: is subject to U.S. export control laws and regulations, the recipient has
:: the responsibility to obtain export licenses or other export authority as
:: may be required before exporting such information to foreign countries or
:: providing access to foreign nationals.
::
:: $Id$

:: Batch file that allows easy execution of the Storage Service Client
:: without the need to set the CLASSPATH or having to type in that long java
:: command (java org.apache.oodt.cas.filemgr.system.XmlRpcFileManagerClient ...)

# Expects the File Manager Client jar file to be in the ../lib directory.

@echo off

:: Set the JAVA_HOME environment variable here in the script if it will
:: not be defined in the environment.
if not defined JAVA_HOME (
  set JAVA_HOME=\path\to\java\home
)

:: Setup environment variables.
set SCRIPT_DIR=%~dps0
set FILEMGR_HOME=%SCRIPT_DIR%..
set FILEMGR_URL=http://localhost:9000

:: Create File Manager support directories.
if not exist "%FILEMGR_HOME%"\logs (
  mkdir "%FILEMGR_HOME%"\logs
)

:: Execute the application.
"%JAVA_HOME%"\bin\java -Djava.ext.dirs="%FILEMGR_HOME%"\lib -Dorg.apache.oodt.cas.filemgr.properties="%FILEMGR_HOME%"\etc\filemgr.properties -Djava.util.logging.config.file="%FILEMGR_HOME%""\etc\logging.properties org.apache.oodt.cas.filemgr.system.XmlRpcFileManagerClient --url %FILEMGR_URL% %*