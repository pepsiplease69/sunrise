#!/usr/bin/perl -w

use strict;
use warnings;

our ( $mylong );
our ( $mylat );
$mylong     = 39.826186;
$mylat      = 21.422459;


sub announce_adhan
{
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=airport_chime1" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan_AbdulBasit&gain=200" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=Ezan_IsaAydin&gain=40" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan-AbadharHalwachi&gain=40" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan-MasjideKufa&gain=200" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan-Shia&gain=70" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/adhan.mp3" );
}

sub announce_sunrise
{
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=sunrise" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/sunrise.mp3" );
}

sub announce_sunset
{
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=sunset" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/sunset.mp3" );
}

sub announce_twilight
{
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=twilight" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/zen.mp3" );
    system ( "/usr/bin/mpg321 /home/pi/sounds/twilight.mp3" );
}
