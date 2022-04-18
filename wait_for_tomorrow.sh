#!/bin/bash

current_epoch=$(date +%s)
target_epoch=$(date --date 'tomorrow 2am' +%s)

sleep_seconds=$(( $target_epoch - $current_epoch ))

sleep $sleep_seconds

date


