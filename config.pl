#!/usr/bin/perl -w

use strict;
use warnings;

our ( $mylong );
our ( $mylat );
$mylong     = 39.826186;
$mylat      = 21.422459;


sub announce_adhan
{
    system ( "/usr/bin/mpg321 /home/pi/sounds/adhan.mp3" );
}

sub announce_sunrise
{
    system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/sunrise.mp3" );
}

sub announce_sunset
{
    system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/sunset.mp3" );
}

sub announce_twilight
{
    system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/twilight.mp3" );
}
