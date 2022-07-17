#!/bin/bash

# Simple bash script to run the imwheel process just once at startup (in case there are more already running)

total_imwheel_processes=$(pgrep -la imwheel | wc -l); # returns a number of total processes

if [[ total_imwheel_processes -gt 1 ]]
then
	$(imwheel --kill);
else
	$(imwheel);
fi