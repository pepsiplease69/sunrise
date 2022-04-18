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
                        latitude  => $mylat,
                        altitude  => 30
                      );







##################################################

# generating DateTime objects from a DateTime::Event::Sunrise object
my $sunset_dt  = $sun_Martinez->sunset_datetime($today_dt);

my $tmp2_dt = $sunset_dt->clone;
$tmp2_dt->set_time_zone( "local");

print  "Date: " . $today_dt->datetime . "\n" .
       "Alarm: " . $tmp2_dt->hms . "\n" .
       "asr-end: " . $sunset_dt->hms . "\n";





if ( time() > $tmp2_dt->epoch() )   # if current time is greater than scheduled event
                                    # then the event occurred in the past
                                    # no need to schedule it, just print message
                                    # and exit program
{
    print "Event occured in the past\n";
    exit();
}



# creating a timer and a loop ojbect

my $loop2  = IO::Async::Loop->new;
my $timer2 = IO::Async::Timer::Absolute->new(
        time      => $tmp2_dt->epoch(),
        on_expire => sub {
                    announce_asr_end ( );
                    $loop2->stop;
                 },
        );

$loop2->add ( $timer2 );
$loop2->run;


