datashare
===============

Datashare provides a customized version of the XTF application from the CDL (California Digital Library).  It is currently used to provide search and discovery for data sets relating to research at the University of California.  

**UCSF Datashare:** [http://datashare.ucsf.edu](http://datashare.ucsf.edu)

NOTE: The installation procedure for datashare is similar to the general installation process for the XTF application.  Documentation for XTF is available at http://xtf.cdlib.org/

## Installing datashare

1. Download the DataShare (XTF) application

git clone https://github.com/CDLUC3/datashare


2. Start the application

run ./tomcat/bin/startup.sh

Navigate to

http://localhost:8080

You should be able to view and browse a few test records.


3. Download metadata from Merritt

DataShare comes with a python (2.7) script that will retrieve metadata relating to all files uploaded to a target repository in Merritt.  You can only perform this step if you have created and populated a merritt repository.

Please contact Perry Willett (perry.willett@ucop.edu) for more information.

The XTF application will provide search and discovery for all records in the directory:
tomcat/webapps/xtf/data

To download metadata from Merritt to this directory, run the python script parseFeed13.py in tomcat/webapps/xtf:

% python parseFeed13.py https://merritt.cdlib.org/object/recent.atom?collection=ark:/<collectionparameters> collection_name

NOTE: you will receive the correct collection parameters and name when you create your merritt repository.  


4. Rebuild the XTF index

From the root directory, run

% ./textIndexer -clean -index default

You will need to restart tomcat to reload the index


5. Configure links to your DataIngest application.

Unfortunately, this is currently hard-coded in a few different locations.  

Change the link

http://datashare-ingest.ucsf.edu

To the link to your institution's DataIngest instance in the following files:

* resultFormatter.xsl
* searchForms.xsl
* docFormatter.xsl
* errorGen.xsl

