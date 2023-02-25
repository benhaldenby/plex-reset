# resetplex.sh

RAID_PATH="/Volumes/RAID"
RAID1_PATH="/Volumes/RAID 1"
PLEX_PATH="$HOME/Library/Application Support/Plex Media Server"

# Remove existing symbolic link
echo "Resetting Plex Media Server"
rm ~/Library/Application\ Support/Plex\ Media\ Server
sleep 1

# Check if RAID is mounted and create symbolic link
if [[ -d "$RAID_PATH" ]]; then
  ln -s "$RAID_PATH/Plex Media Server" "$PLEX_PATH"
  echo "Created symbolic link to Plex Media Server on $RAID_PATH"
# Check if RAID 1 is mounted and create symbolic link
elif [[ -d "$RAID1_PATH" ]]; then
  ln -s "$RAID1_PATH/Plex Media Server" "$PLEX_PATH"
  echo "Created symbolic link to Plex Media Server on $RAID1_PATH"
# If neither RAID nor RAID 1 is mounted, print error message
else
  echo "Error: RAID or RAID 1 not found."
fi

open /Applications/Plex\ Media\ Server.app
echo "Plex Media Server has been restarted"

# rm ~/Library/Application\ Support/Plex\ Media\ Server
# sleep 2
# ln -s /Volumes/RAID\ 1/Plex\ Media\ Server ~/Library/Application\ Support
# ln -s /Volumes/RAID/Plex\ Media\ Server ~/Library/Application\ Support
# 
# open /Applications/Plex\ Media\ Server.app
# echo "Plex Media Server has been restarted"