# RobotFramework
Building tests using the RobotFramework

# Install python3
Install Python3
# Install pip package manager
Install pip
# Install robotframework using python3 pip
python3 -m pip install robotframework
# Install and upgrade the selenium2library
pip3 install --upgrade robotframework-selenium2library
# Install WebDriver Manager to help with installing required browser drivers
pip3 install webdrivermanager
# Install the chrome driver and create a symlink to /usr/local/bin
webdrivermanager chrome --linkpath /usr/local/bin
# Run the "WebApp_AssertString.robot test to confirm
Under the tests directory, execute the WebApp_AssertString.robot test by running "robot -T -d Results WebApp_AssertString.robot"

If all is configured as expected, the above test exection should call the chrome browser driver and then execute the .robot test.

I am developing my tests in the IDE PyCharm as it has plugin support for the RobotFramework, however other options like ATOM will work.

# API Tests
pip3 install -U robotframework-requests

# Start a simple Web Server
For proof of concept and/or testing in an isolated environment, you may find it useful to start a web server locally and then run your .robot test against any .html files located within the directory where you executed python3 -m http.server.

# Mock REST API
Install node.js which in turn will install npm.

Update npm via npm install npm@latest -g

Install json-server via npm install -g json-server

Create a db.json file to populate the endpoints.

Launch the json-server with your db.json file via json-server --watch PATH/TO/db.json

# DB Testing
sudo -H pip3 install -t /usr/local/lib/python3.7/site-packages  robotframework-databaselibrary

sudo -H pip3 install -t /usr/local/lib/python3.7/site-packages  PyMySQL 

sudo -H pip3 install -t /usr/local/lib/python3.7/site-packages  cryptography
