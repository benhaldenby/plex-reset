# plex.sh

echo "Stopping Plex Media Server"
osascript -e 'quit app "Plex Media Server"'
sleep 3
echo "Stopping Transmission"
osascript -e 'quit app "Transmission"'
sleep 3
rm ~/Library/Application\ Support/Plex\ Media\ Server
echo "Unmounting RAID"
diskutil unmount /dev/disk8s1
sleep 2
echo "Mounting RAID"
diskutil mount /dev/disk8s1
sleep 6
echo "Renaming RAID"
diskutil rename /dev/disk8s1 RAID
sleep 1
echo "Creating symlink to RAID"
ln -s /Volumes/RAID/Plex\ Media\ Server ~/Library/Application\ Support
sleep 10
open /Applications/Plex\ Media\ Server.app
echo "Plex Media Server has been restarted"
open /Applications/Transmission.app
echo "Transmission has been restarted"
echo "Update PlexCron.txt"
touch ~/Library/Application\ Support/Plex\ Media\ Server/PlexReset.txt