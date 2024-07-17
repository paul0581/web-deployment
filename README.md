The script automates the setup of a web server and the deployment of a web application on either CentOS or Ubuntu. Here's a summary of its actions:

Variable Declaration: Defines URL, ART_NAME, and TEMPDIR variables.

OS Check: Determines if the script is running on CentOS (using yum --help).


CentOS Branch:

Sets package and service names for CentOS.

Installs necessary packages (httpd, wget, unzip).

Starts and enables the HTTPD service.

Creates a temporary directory, downloads and unzips the web application, and copies it to the web server root.

Restarts the HTTPD service.

Cleans up temporary files.

Checks the status of the HTTPD service and lists the web server root directory contents.


Ubuntu Branch:

Sets package and service names for Ubuntu.

Installs necessary packages (apache2, wget, unzip).

Starts and enables the Apache2 service.

Creates a temporary directory, downloads and unzips the web application, and copies it to the web server root.

Restarts the Apache2 service.

Cleans up temporary files.

Checks the status of the Apache2 service and lists the web server root directory contents.

The script ensures that the appropriate web server is set up, the application is deployed, and the web server is running correctly.
