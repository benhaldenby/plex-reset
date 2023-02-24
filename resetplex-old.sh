: <<'END'
echo "Stopping Plex Media Server"
osascript -e 'quit app "Plex Media Server"'
echo "Stopping Transmission"
osascript -e 'quit app "Transmission"'
sleep 2

rm ~/Library/Application\ Support/Plex\ Media\ Server
sleep 2

echo "Unmounting RAID"
diskutil unmount /Volumes/RAID
diskutil unmount /Volumes/RAID
sleep 2

echo "Mounting RAID""
diskutil mount /dev/disk8s1
sleep 5

echo "Renaming RAID"
diskutil rename /Volumes/RAID RAID
diskutil rename /Volumes/RAID\ 1 RAID
sleep 5

echo "Creating symlink to RAID"
# ln -s /Volumes/RAID\ 1/Plex\ Media\ Server ~/Library/Application\ Support
ln -s /Volumes/RAID/Plex\ Media\ Server ~/Library/Application\ Support
sleep 10

open /Applications/Plex\ Media\ Server.app
echo "Plex Media Server has been restarted"

open /Applications/Transmission.app
echo "Transmission has been restarted"

echo "Update PlexCron.txt"
touch ~/Library/Application\ Support/Plex\ Media\ Server/PlexReset.txt
END
