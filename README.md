# PlexReset

Simple batch script to fix problems with external volumes randomly unmounting, renaming themselves and screwing with Plex Media Server.

Clone repo and run 

    install.sh

Then automate running the script, perhaps daily with a cron job

    crontab -e
    00 06 * * * /usr/local/bin/plex-reset.sh