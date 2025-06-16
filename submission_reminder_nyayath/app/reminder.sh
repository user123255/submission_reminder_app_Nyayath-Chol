#!/usr/bin/env bash
echo "Reminder script running..."
#Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: "
echo "Days remaining to submit:  days"
echo "--------------------------------------------"

check_submissions 
EOF

# Create the functions.sh file
cat <<EOL > "submission_reminder_nyayath/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=
    echo "Checking submissions in "

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=
        assignment=
        status=

        # Check if assignment matches and status is 'not submitted'
        if [[ "" == "" && "" == "not submitted" ]]; then
            echo "Reminder:  has not submitted the  assignment!"
        fi
    done < <(tail -n +2 "") # Skip the header
}

# Create the submissions.txt file with sample data
cat <<EOL > "submission_reminder_nyayath/assets/submissions.txt"
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

EOF

# Create the config.env file
cat <<EOL > "submission_reminder_nyayath/config/config.env"
ASSIGNMENT=assignment1
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Create the startup.sh file
cat <<EOL > "submission_reminder_nyayath/startup.sh"
#!/usr/bin/env bash
echo "Starting the reminder app..."
bash app/reminder.sh

EOF


# Make all .sh files executable
chmod u+x "submission_reminder_nyayath/app/"*.sh
chmod u+x "submission_reminder_nyayath/startup.sh"

echo "Environment setup completed successfully."
