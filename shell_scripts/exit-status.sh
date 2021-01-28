wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war >> /dev/null
if [ $? -eq 0 ]; then
echo "file downloaded" 
else
echo "provide proper link to download"
fi
