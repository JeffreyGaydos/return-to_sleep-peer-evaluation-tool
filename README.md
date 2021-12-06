# return-to_sleep Peer Evaluation Tool
Final project for 3901. A peer evaluation tool based on past ways of evaluating team members for 3901.

## How to Run:
* Clone repo
* Run "bundle"
* Run "yarn install --check-files" to get necessary node_modules
  * Use Node v12.22.5 and yarn 1.22.11 if you run into an issue here
* Ensure you have ruby 2.7.0 installed. If not, use this to do so: https://gist.github.com/esteedqueen/b605cdf78b0060299322033b6a60afc3
* Ensure that a recent version of rails is installed (tested on rails 6.0.4.1)
* [CHANGE: may be deployed using Heroku]Run "rails server", then go to https://localhost/3000 to view the site
  * If you recieve "show-stopper" errors, try running these commands: "bundle clean --force" and then "bundle install --without production"

## Requirements Completed:
* Seperate admin interface:
  * Admins can view scores given to teams and students related to peer evaluations for multiple projects
  * Admins initiate peer evaluation availability
* Admins can create classes and teams, and add students to both
* Students have a way to add peer evaluations for multiple projects for each student
## Extra Features Completed:
* Authentication, login, and accounts prevent students from accessing admin features
* Students can add and drop classes at will
* Deployed on Heroku
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