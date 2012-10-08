#!/bin/bash

# This is a shell script that essentially pings everything in my local network
# interacively.
# TODO: It really should just parse the output and figure out if its a success
# or not. If its not a success then stop that ping and go on to the next one.

for ((i = 1; i < 116; i++));
do {
	ping 192.168.1.$i;
} done
