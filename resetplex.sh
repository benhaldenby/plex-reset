# plex.sh

echo "Resetting Plex Media Server"

rm ~/Library/Application\ Support/Plex\ Media\ Server
ln -s /Volumes/RAID\ 1/Plex\ Media\ Server ~/Library/Application\ Support

open /Applications/Plex\ Media\ Server.app
echo "Plex Media Server has been restarted"