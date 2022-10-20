#!/bin/bash

lid_state=$(cat /proc/acpi/button/lid/LID/state)
current=lid_state
echo $lid_state
while [ "$lid_state" != "$current" ]; do
    lid_state=$(cat /proc/acpi/button/lid/LID/state)
done
echo $lid_state