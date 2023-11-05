#!/bin/bash
echo "########################## Check if listen-app is running or not ##########"
ps -ef | grep listen-app.jar
echo "########################## Kill running listen-app ########################"
pkill -f listen-app.jar
echo "Killed listen-app"
sleep 5s
echo "########################## Check if listen-app is running or not ##########"
ps -ef | grep listen-app.jar
echo "########################## Take Backup of old jar ########################"
mv /app/listen-app/release/listen-app.jar /app/listen-app/backup
echo "Backup completed successfully"
echo "########################## Move to jar to Release ########################"
mv /app/listen-app/staging/listen-app.jar /app/listen-app/release
echo "JAR moved to release"
echo "########################## Deploy listen-app ##############################"
java -jar /app/listen-app/release/listen-app.jar &
echo "Successfully deployed listen-app"
echo "########################## Check if listen-app is running or not ##########"
ps -ef | grep listen-app.jar