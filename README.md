# sunrise

Set up the correct locale and timezone on the device
```
sudo raspi-config
```



Installation: 

```
sudo apt-get install git
git clone https://github.com/pepsiplease69/sunrise.git
```
Afterwards, run the command

```
setup.sh
```
Afterwards, edit the cronjob.txt file and install the cronjobs

```
crontab -i cronjob.txt
crontab -l
```

Optional: Install mpg321 utility to play audio/mp3 files:

```
sudo apt-get install mpg321
```
