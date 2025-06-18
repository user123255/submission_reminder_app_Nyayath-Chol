#!/bin/bash

# This script sets up the environment for the submission reminder app 
# Prompt user for their name
read -p "What's your name: " user_name

export user_name

# Create main directory
app_dir="submission_reminder_${user_name}"
mkdir "$app_dir" 


# Create subdirectories
mkdir -p "$app_dir/app"
mkdir -p "$app_dir/modules"
mkdir -p "$app_dir/assets"
mkdir -p "$app_dir/config"


# Create the reminder.sh file
cat <<'EOL' > "$app_dir/app/reminder.sh"
#!/usr/bin/env bash
echo "Reminder script running..."
#Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

# Create the functions.sh file
cat <<'EOL' > "$app_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
         exit 1

     fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL



# Create the submissions.txt file with sample data
cat <<EOL > "$app_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
John John, Shell Navigation, submitted
Nyayath Lual, Git, not submitted
Sarah Ayen, Shell Basics, not submitted
Mary Daniel, Shell Navigation, submitted
Chan Chan , Git, submitted
David Garang, Shell Basics, submitted 

EOL

# Create the config.env file
cat <<EOL > "$app_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
USER_NAME="$user_name"
EOL

# Create the startup.sh file
cat <<EOL > "$app_dir/startup.sh"
#!/usr/bin/env bash
echo "Starting the reminder app..."
bash app/reminder.sh

EOL


# Make all .sh files executable
chmod u+x "$app_dir/app/"*.sh
chmod u+x "$app_dir/startup.sh"

echo "Environment setup completed successfully."
