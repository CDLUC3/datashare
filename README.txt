General Information:

Prior to installing this application, you may want to work through the XTF beginner tutorial at

    http://xtf.wiki.sourceforge.net/beginnerTutorial

Thanks.

This application is a version of XTF configured to work with datacite xml schema, used by the dataingest application available at 

(bitbucket repo).

A fuller explanation of each step below is available at the tutorial site.  

Step 1:

1. Download the DataShare (XTF) application

bitbucket repo

https://bitbucket.org/datashare/ucsfDataShare


2. Start the application 

run ./tomcat/bin/startup.sh

Navigate to 

http://localhost:8080

You should be able to view and browse a few test records.


3. Download the metadata from Merritt

NOTE: you can only perform this step if you have created and populated a merritt repository.
Please contact ?? for more information.

The XTF application will provide search and discovery for all records in the directory:
tomcat/webapps/xtf/data 

To download metadata from Merritt to this directory, run the python script parseFeed13.py in tomcat/webapps/xtf
NOTE: if you don't want to keep the existing test records, you should delete them prior to this step.
NOTE: currently tested only on python 2.7.1

% python parseFeed13.py https://merritt.cdlib.org/object/recent.atom?collection=ark:/<collectionparameters> collection_name

NOTE: you will receive the correct collection parameters and name when you create your merritt repository


4. Rebuild the XTF index

From the root directory, run

% ./textIndexer -clean -index default

You will need to restart tomcat to reload the index


5. Configure links to your DataIngest application.

Change the link

http://datashare-ingest.ucsf.edu

To the link to your institution's DataIngest instance in the following files:

resultFormatter.xsl
searchForms.xsl
docFormatter.xsl
errorGen.xsl











