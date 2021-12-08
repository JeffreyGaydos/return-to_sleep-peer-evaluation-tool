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

## How to Use:  
* We reccomend preloading users with the seed file 
  * To do so run: rails db:reset
* Adding more accounts with sign-up:
    * User info needed: name, email and password
    * Admin info needed: name, email, password, and institution name
* Institutions must be hardcoded into the DB
  * The seed file has: 'OSU', 'LSU', and 'Xichigan'  
  * Type one of these strings in when you sign up as an admin (It should ask you to authorize)
  * Note that if you do not authorize with an institution, you can do so
  later and an account will still be present for you before verification
* Account is the hub of the web application. It's a snapshot of information pertinant to you. It alows the user to edit information related to them.
  * The user will see: enrolled courses, teams, administrators, and peer evaluations
  * The admin will see: managed courses, managed teams, co-administrators, and peer evaluations
* The courses tab allows users to find new courses and enroll in them. Admins can simply add new courses.
* The teams tab allows users to view the teams and projects they have been assigned to. In addition admins have complete control of editing teams and projects.
* You will likely find the links on the dashboard to be most intuitive
  * if you ever get lost, click the "Account" button in the header of the page
  * Also, see the "Routes Reference" section below

## Requirements Completed:
* Seperate admin interface:
  * Admins can view scores given to teams and students related to peer evaluations for multiple projects
  * Admins initiate peer evaluation availability
* Admins can create classes and teams, and add students to both
* Students have a way to add peer evaluations for multiple projects for each student
## Extra Features Completed:
* Authentication, login, and accounts prevent students from accessing admin features
* Students can add and drop classes at will

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
* Course code and search functionality for users and admins

# Selected Routes Reference
If you get really lost, here are the urls directly:
* '/' or '/home' - The homepage
* '/login' - The login page
* '/logout' - Internal use only, but a user can manually log out by navigating to this page
* '/sign_up' - The sign up page for "student" users
* '/sign_up/instructors' - The sign up page for "admin" users
* '/sign_up/institution_auth' - The institution authentication page once an admin has been created
* '/about' - A page displaying this readme
* '/courses/add' - for admins, allows them to create a course
* '/courses' - Lists all courses available to enroll in as a user
* '/users/{user id}' - The account page for a user (only viewable if logged in)

  resources :users
  resources :admins
  resources :courses
  resources :institutions
  get 'delete_account', to: 'users#delete_account'
  delete 'delete_account', to: 'users#delete_confirmed'

  resources :teams

  # For acessing specific users that are part of a team.
  resources :teams do
    resources :teams_user
  end

  # Route for adding students to a team
  get '/teams/:id/students', to: 'teams#students', as: 'team_students_get'
  # POST for adding a new student.
  patch '/teams/:id/students/', to: 'teams#students_patch', as: 'team_students_patch'
  delete '/teams/:id/students/', to: 'teams#students_delete', as: 'team_students_delete'

  # Routes for accessing projects for a team
  resources :teams do
    resources :projects
  end

  patch '/teams/:team_id/projects/:id/toggle_eval', to: 'projects#set_needs_eval'

  # resources :teams do
  #   resources :projects do
  #     resources :peer_eval do
  #         get 'teams/:id/projects/:id/peer_eval/:id', to: 'peer_eval#test'
  #       end
  #   end
  # end

  resources :teams do
    resources :projects do
      resources :peer_eval
    end
  end

post '/teams/:team_id/projects/:project_id/peer_eval/:id', to: 'peer_eval#create'

end

