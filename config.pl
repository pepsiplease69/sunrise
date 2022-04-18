#!/usr/bin/perl -w

use strict;
use warnings;

our ( $mylong );
our ( $mylat );
our ( $myalt );
our ( $fajrOffset );
our ( $imsakOffset );
our ( $ishaOffset );
$mylong     = +39.826;
$mylat      = +21.422;
$myalt      = 16.68;         # meters


$fajrOffset       = 5;                 # time before astronomical twilight to announce imsak
$imsakOffset    = $fajrOffset + 5;  # warning shot before imsak
$ishaOffset       =  22;                # time after sunset to announce isha




sub announce_imsak
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=airport_chime1" );
}

sub announce_fajr
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=twilight" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/twilight.mp3" );
}

sub announce_sunrise
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=sunrise" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/sunrise.mp3" );
}


sub announce_zuhr
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan_AbdulBasit&gain=200" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/adhan.mp3" );
}

sub announce_asr_start
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=plane-ding&gain=200" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/adhan.mp3" );
}

sub announce_asr_end
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=plane-ding&gain=200" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=plane-ding&gain=200" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/adhan.mp3" );
}



sub announce_sunset
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=sunset" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/sunset.mp3" );
}



sub announce_maghrib
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan-Shia" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/adhan.mp3" );
}


sub announce_moonrise
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=airport_chime3" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=moonrise" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/sunrise.mp3" );
}

sub announce_moonset
{
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=airport_chime3" );
    get ( "http://10.0.1.187/cgi-bin/play.pl?file=moonset" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    #system ( "/usr/bin/mpg321 /home/pi/sounds/sunset.mp3" );
}


