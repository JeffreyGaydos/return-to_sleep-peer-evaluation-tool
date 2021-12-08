# return-to_sleep Peer Evaluation Tool
Final project for 3901. A peer evaluation tool based on past ways of evaluating team members for 3901.

## How to Run:
* Clone repo.
* Run "bundle".
* Run "yarn install --check-files" to get necessary node_modules.
  * Use Node v12.22.5 and yarn 1.22.11 if you run into an issue here.
* Ensure you have ruby 2.7.0 installed. If not, use this to do so: https://gist.github.com/esteedqueen/b605cdf78b0060299322033b6a60afc3
* Ensure that a recent version of rails is installed (tested on rails 6.0.4.1).
* [CHANGE: may be deployed using Heroku]Run "rails server", then go to https://localhost/3000 to view the site.
  * If you recieve "show-stopper" errors, try running these commands: "bundle clean --force" and then "bundle install --without production"

## How to Use:  
* We reccomend preloading users with the seed file 
  * To do so run: rails db:reset
* Adding more accounts with sign-up:
    * User info needed: name, email and password
    * Admin info needed: name, email, password, and institutions
* Institutions must be hardcoded into the DB
  * The seed file has: 'OSU', 'LSU', and 'Xichigan'    
* Account is the hub of the web application. It's a snapshot of information pertinant to you. It alows the user to edit information related to them.
  * The user will see: enrolled courses, teams, administrators, and peer evaluations
  * The admin will see: managed courses, managed teams, co-administrators, and peer evaluations
* The courses tab allows users to find new courses and enroll in them. Admins can simply add new courses.
* The teams tab allows users to view the teams and projects they have been assigned to. In addition admins have complete control of editing teams and projects.
* To start a peer evaluation you have to view a team and then view an associated project.
  * This can be done quickly thru the 'Account' tab, or more slowly thru the 'Team' tab.
* There are three states to the peer evaluations:
  * (Blank): It has not been started.
  * Pending: Waiting for feedback.
  * Completed: Recieved feedback.

## Adding Students to a Course
* We set it up so users are the only ones able to add themselves to classes.
  * This was intentional so that admins do not need to go thru and manually enter each student.

## Requirements Completed:
* Seperate admin interface:
  * Admins can view scores given to teams and students related to peer evaluations for multiple projects.
  * Admins initiate peer evaluation availability.
* Admins can create classes and teams.
* Students have a way to add peer evaluations for multiple projects for each student.

## Extra Features Completed:
* Authentication, login, and accounts prevent students from accessing admin features.
* Students can add and drop classes at will.
* The login system is done using bcrypt.
* Institutions verfication for the admins.
* An access denied page when trying to visit pages a visitor shouldn't.
* Changing enrollment. Students might add or drop the course.
* Support for multiple group structures. A student may belong to multiple groups simultaneously.
* Admin dashboard to monitor submission of peer evaluations.


## Resources Used:
Markdown Compilation for home page:
* https://web-crunch.com/posts/how-to-add-markdown-support-to-ruby-on-rails

Tutorial code emulated primarily for User model and authentication systems:
* Ruby on Rails Tutorial, 6th Edition - Michael Hartl

Illustration on home page:
* https://www.chalk.com/resources/3-ways-peer-review-can-build-student-engagement/

## Things we would have liked to add, time permitting:
* Profile images
* Public profiles
* Greater security and email validation, especially for institution validation
* Deploying to heroku

