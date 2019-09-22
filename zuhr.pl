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
require ( "./config.pl" );







  my $sun_Martinez  = DateTime::Event::Sunrise->new (
                        longitude => $mylong,
                        latitude  => $mylat);



##################################################


# generating DateTime objects from a DateTime::Event::Sunrise object
my $sunrise_dt = $sun_Martinez->sunrise_datetime ($today_dt);
my $sunset_dt  = $sun_Martinez->sunset_datetime  ($today_dt);


# Generating midday objects by averaging sunrise and sunset
my $sunrise_epoch = $sunrise_dt->epoch();
my $sunset_epoch  = $sunset_dt->epoch();
my $midday_epoch = ( $sunrise_epoch + $sunset_epoch ) / 2;
my $midday_dt = DateTime-> from_epoch(
                      epoch => $midday_epoch,
                      time_zone => "local" );




my $tmp1_dt = $midday_dt->clone;
$tmp1_dt->set_time_zone( "local");

print  "Date: " . $today_dt->datetime . "\n" .
       "Sunrise: " . $sunrise_dt->hms . "\n" .
       "Alarm: " . $tmp1_dt->hms . "\n\n\n";



my $loop1  = IO::Async::Loop->new;
my $timer1 = IO::Async::Timer::Absolute->new(
        time      => $tmp1_dt->epoch(),
        on_expire => sub {
                    announce_adhan ( );
                    $loop1->stop;
                 },
        );




$loop1->add ( $timer1 );
$loop1->run;









