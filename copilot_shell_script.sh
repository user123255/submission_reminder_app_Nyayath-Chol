#!/bin/bash

# This script prompts for an assignment name, updates the ASSIGNMENT value
# in config/config.env, and finally rund the strtup.sh

CONFIG_FILE="config/config.env" # Please define the config file path
echo -e "name is $user_name"


# prompt the user for the assignment name 
read -p "Enter the new assignment name: " assignment_name

cd "$submission_reminder_${user_name}"

# Replace the value of the ASSIGNMENT in line 2 using sed
sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=$assignment_name/" "$CONFIG_FILE"

# Confirm update
echo "updated assignment name in "$CONFIG_FILE" to: $assignment_name"

# run startup.sh
if [[ -f "startup.sh" && -x "startup.sh" ]]; then 
	echo "Running startup.sh to check submission status..."
	./startup.sh
	exit 1
fi 
     
