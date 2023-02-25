# ResetPlex install script
# cp resetplex.sh /usr/local/bin/resetplex.sh
# chmod +x /usr/local/bin/resetplex.sh
cp com.slimpixels.resetplex.plist /Library/LaunchDaemons/com.slimpixels.resetplex.plist
launchctl load /Library/LaunchDaemons/com.slimpixels.resetplex.plist
launchctl list | grep com.slimpixels.resetplex