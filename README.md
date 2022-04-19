# sunrise

Set up the correct locale and timezone on the device
```
sudo raspi-config
```





## Installation: 

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



## Configuration:
All of the configurable parameters are stored in a file called `config.pl`

Override the following variables to configure your geo-coordinates and altitude

```
$mylong     = +39.826;
$mylat      = +21.422;
$myalt      = 16.68;         # meters
```

The following variables can be customized to offset the times for imsak and isha, represented in minutes.

```
$fajrOffset       = 5;                 # time before astronomical twilight to announce imsak
$imsakOffset    = $fajrOffset + 5;     # warning shot before imsak
$ishaOffset       =  22;               # time after sunset to announce isha
```

After this each of the handler functions are defined which allows one to override/specify the tasks to be performed when an event occurs (typically some sort of announcement).

```
sub announce_sunrise
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=sunrise" );     # does a fetch on a url
    #system ( "/usr/bin/mpg321 /home/pi/sounds/sunrise.mp3" );    # plays an mp3 file
}
```


