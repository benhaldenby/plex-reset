# Get the name of the newly mounted volume
NEW_VOLUME=$(basename "$1")

RAID_PATH="/Volumes/RAID"
PLEX_APP="/Applications/Plex Media Server.app"
PLEX_METADATA="$HOME/Library/Application Support/Plex Media Server"

# Check if the new volume is called "RAID 1"
if [ "$NEW_VOLUME" = "RAID 1" ]; then
  # Rename the new volume to "RAID"
  diskutil rename "$1" "RAID"
  
  echo "📝 Volume renamed to RAID"
else
  # Output a comment
  echo "✅ Volume already renamed RAID"
fi

echo "Resetting Plex Media Server"
rm "$PLEX_METADATA"
sleep 1
ln -s "$RAID_PATH/Plex Media Server" "$PLEX_METADATA"

open "$PLEX_APP"
echo "Plex Media Server has been restarted"