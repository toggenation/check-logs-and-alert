# Check for a Bing or Google Bot Visit and Send and Alert using ssmtp

This script sends an alert when it sees a visit by Bing or Google Bot.

When it sees an entry it will call `ssmtp` and send an email.

## Requires

ssmtp

```
apt-get install ssmtp
```


## Crontab 

Run script every 5 minutes

```
*/5 * * * * /path/to/the/scripts/checkForBing.sh > /dev/null 2>&1
```
