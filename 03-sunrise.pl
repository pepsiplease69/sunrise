#!/usr/bin/perl

use DateTime;
use DateTime::Duration;
use DateTime::Event::Sunrise;
use strict;

use IO::Async::Timer::Absolute;
use IO::Async::Loop;

use LWP::Simple;

  my $today_dt = DateTime->today( time_zone => "local" );

our ( $mylong );
our ( $mylat );
require ( "/home/pi/sunrise/config.pl" );



  my $sun_Martinez  = DateTime::Event::Sunrise->new (
                        longitude => $mylong,
                        latitude  => $mylat);



##################################################


# generating DateTime objects from a DateTime::Event::Sunrise object
my $sunrise_dt = $sun_Martinez->sunrise_datetime($today_dt);



my $tmp1_dt = $sunrise_dt->clone;
$tmp1_dt->set_time_zone( 'local');

print  "Date: " . $today_dt->datetime . "\n" .
       "Sunrise: " . $sunrise_dt->hms . "\n" .
       "Alarm: " . $tmp1_dt->hms . "\n\n\n";



if ( time() > $tmp1_dt->epoch() )   # if current time is greater than scheduled event
                                    # then the event occurred in the past
                                    # no need to schedule it, just print message
                                    # and exit program
{
    print "Event occured in the past\n";
    exit();
}


# creating a timer and a loop ojbect
my $loop1  = IO::Async::Loop->new;
my $timer1 = IO::Async::Timer::Absolute->new(
time      => $tmp1_dt->epoch(),
on_expire => sub {
                    announce_sunrise (  );
                    $loop1->stop;
                 },
        );




$loop1->add ( $timer1 );
$loop1->run;









