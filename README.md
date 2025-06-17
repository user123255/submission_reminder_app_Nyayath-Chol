# submission_reminder_app_Nyayath-Chol

Hi there! 
This is my shell scripting project called Submission Reminder App. The goal of this task was to build a shell-based system that reminds students who haven’t submitted their assignments. It was a fun challenge and helped me practice scripting, automation, and working with files and directories in Linux.

What the App Does
This app checks a file that contains student submission records and shows which students still need to submit a specific assignment.
Below is what the App does 

•	Automatically create all folders and files needed for the app to work.
•	Read a list of student submissions and find out who hasn’t submitted.
•	Let me change the assignment name anytime and re-check.
•	Run everything through a single startup script.

Project Structure

submission_reminder_{MyName}/
├── config/
│   └── config.env
├── modules/
│   └── functions.sh
├── data/
│   └── submissions.txt
├── scripts/
│   ├── reminder.sh
│   └── startup.sh

When I run the setup script, {MyName} is replaced by the name I enter. All the provided files are copied into their correct locations.


How to Set It Up
1.	First, clone the repo and go into the folder: submission_reminder_app_Nyayath-Chol
/
2.	Change directory to submission_reminder_app_Nyayath (Yourname)
3.	Then, make the setup script executable and run it using the change mode command,
chmod +x create_environment.sh
After you will have to treat it using the ./create_environment.sh  command 
•	You’ll be asked to enter your name.
•	The script will create the directory, organize everything inside, and make all .sh files executable.
•	I also added 5 more student records to the submissions.txt file so it can be tested properly.
4.	After setup, run the app like this:
Change directory to submission_reminder_Nyayath
./scripts/startup.sh
It will print out a list of students who haven’t submitted the assignment.


Updating the Assignment Name
I created another script called copilot_shell_script.sh. It allows me to change the assignment name and check the new submission status.
To use it, you will have to run:

./copilot_shell_script.sh
•	It asks for a new assignment name.
•	It updates the config. env file with the new name.
•	Then it runs the app again to show who hasn't submitted the new assignment.


Git Branches I Used
I followed a simple Git workflow:
•	Created a branch called feature/setup for development.
•	After testing everything, I merged it into the main branch.

And only three files are in the main branch:
•	create_environment.sh
•	copilot_shell_script.sh
•	README.md

Files I Worked With;


These are the files that make the app run:
•	config.env – stores the assignment name.
•	functions.sh – helper functions for checking submissions.
•	reminder.sh – contains the core logic.
•	submissions.txt – list of student submissions.
•	startup. Sh – I created this to bring everything together.


What I Made Sure to Do

•	Created the directory and organized the files.
•	Added more students to submissions.txt.
•	Made all scripts executable.
•	Built a working startup.sh script.
•	Wrote the copilot_shell_script.sh to update assignment names.
•	Tested everything to make sure it runs smoothly.

About Me
I’m Nyayath Lual Deng Chol, and I’m currently learning software engineering. I built this app as part of my shell scripting journey. I really enjoyed the process — it taught me how to automate tasks, work with files, and write clean scripts that solve problems.


Thanks for checking out my work! 
