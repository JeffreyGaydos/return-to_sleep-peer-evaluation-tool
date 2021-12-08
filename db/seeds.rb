# This seed file sets up the peer evaluation file with various objects that will allow
# you to login and view various features of the tool. These objects can also be found in
# the seeds.exel file included adjacent to this file in our submission.
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Institution Objects:
@institution1 = Institution.create(name_id: "OSU")
@institution2 = Institution.create(name_id: "LSU")
@institution3 = Institution.create(name_id: "Xichigan")

# Student Users:
@user1 = User.create(name: "User1", email: "user1@example.com", password: "Something", password_confirmation: "Something")
@user2 = User.create(name: "User2", email: "user2@example.com", password: "Something", password_confirmation: "Something")
@user3 = User.create(name: "User3", email: "user3@example.com", password: "Something", password_confirmation: "Something")
@user4 = User.create(name: "User4", email: "user4@example.com", password: "Something", password_confirmation: "Something")
@user5 = User.create(name: "User5", email: "user5@example.com", password: "Something", password_confirmation: "Something")
@user6 = User.create(name: "User6", email: "user6@example.com", password: "Something", password_confirmation: "Something")
@user7 = User.create(name: "User7", email: "user7@example.com", password: "Something", password_confirmation: "Something")
@user8 = User.create(name: "User8", email: "user8@example.com", password: "Something", password_confirmation: "Something")
@user9 = User.create(name: "User9", email: "user9@example.com", password: "Something", password_confirmation: "Something")
@user10 = User.create(name: "User10", email: "user10@example.com", password: "Something", password_confirmation: "Something")

# Admin Users, or Instructors:
@instructor1 = User.create(name: "Instructor1", email: "instructor1@example.com", password: "Something", password_confirmation: "Something")
@admin1 = Admin.create(user: @instructor1, user_id: @instructor1.id, institution: @institution1, institution_id: @institution1.id)
@instructor2 = User.create(name: "Instructor2", email: "instructor2@example.com", password: "Something", password_confirmation: "Something")
@admin2 = Admin.create(user: @instructor2, user_id: @instructor2.id, institution: @institution2, institution_id: @institution2.id)
@instructor3 = User.create(name: "Instructor3", email: "instructor3@example.com", password: "Something", password_confirmation: "Something")
@admin3 = Admin.create(user: @instructor3, user_id: @instructor3.id, institution: @institution3, institution_id: @institution3.id)

# Courses
@course1 = Course.create(name: "Web Apps 1", class_number: 3901)
@course2 = Course.create(name: "Web Apps 2", class_number: 3902)
@course3 = Course.create(name: "Web Apps 3", class_number: 3903)
@course4 = Course.create(name: "Web Apps 4", class_number: 3904)
@course5 = Course.create(name: "Web Apps 5", class_number: 3905)

# Teams
@team1 = Team.create(name: "Team 1", course: @course1)
@team3 = Team.create(name: "Team 2", course: @course1)
@team2 = Team.create(name: "Team 3", course: @course1)
@team4 = Team.create(name: "Team 4", course: @course2)
@team5 = Team.create(name: "Team 5", course: @course2)
@team6 = Team.create(name: "Team 6", course: @course3)
@team7 = Team.create(name: "Team 7", course: @course4)
@team8 = Team.create(name: "Team 8", course: @course5)

# Projects
@project1 = Project.create(name: "Game of Set", team: @team1)
@project2 = Project.create(name: "Tech Presentation", team: @team1)
@project3 = Project.create(name: "Rails Final", team: @team1)
@project4 = Project.create(name: "Game of Set", team: @team2)
@project5 = Project.create(name: "Game of Set in JS", team: @team2)
@project6 = Project.create(name: "Game of Set", team: @team3)
@project7 = Project.create(name: "Game of Set", team: @team4)
@project8 = Project.create(name: "Game of Set", team: @team5)
@project9 = Project.create(name: "Game of Set", team: @team6)
@project10 = Project.create(name: "Game of Set", team: @team7)
@project11 = Project.create(name: "Game of Set", team: @team8)

# Peer-Eval objects
@peerEval1 = PeerEval.create(score: 10, comment: "Nothing: 10/10", user_id: 1, team_id: 1, project_id: 1, evaluated_user: 2)
@peerEval2 = PeerEval.create(score: 7, comment: "Nothing: 7/10", user_id: 1, team_id: 1, project_id: 1, evaluated_user: 3)
@peerEval3 = PeerEval.create(score: 8, comment: "Nothing: 8/10", user_id: 1, team_id: 1, project_id: 1, evaluated_user: 4)
@peerEval4 = PeerEval.create(score: 8, comment: "Nothing: 8/10", user_id: 2, team_id: 1, project_id: 1, evaluated_user: 1)
@peerEval5 = PeerEval.create(score: 5, comment: "Nothing: 5/10", user_id: 2, team_id: 1, project_id: 1, evaluated_user: 3)
@peerEval6 = PeerEval.create(score: 6, comment: "Nothing: 6/10", user_id: 2, team_id: 1, project_id: 1, evaluated_user: 4)
@peerEval7 = PeerEval.create(score: 8, comment: "Nothing: 8/10", user_id: 3, team_id: 1, project_id: 1, evaluated_user: 1)
@peerEval8 = PeerEval.create(score: 10, comment: "Nothing: 10/10", user_id: 3, team_id: 1, project_id: 1, evaluated_user: 2)
@peerEval9 = PeerEval.create(score: 7, comment: "Nothing: 7/10", user_id: 3, team_id: 1, project_id: 1, evaluated_user: 4)
@peerEval10 = PeerEval.create(score: 8, comment: "Nothing: 8/10", user_id: 4, team_id: 1, project_id: 1, evaluated_user: 1)
@peerEval11 = PeerEval.create(score: 4, comment: "Nothing: 4/10", user_id: 4, team_id: 1, project_id: 1, evaluated_user: 2)
@peerEval12 = PeerEval.create(score: 10, comment: "Nothing: 10/10", user_id: 4, team_id: 1, project_id: 1, evaluated_user: 3)
@peerEval13 = PeerEval.create(score: 8, comment: "Nothing: 8/10", user_id: 1, team_id: 1, project_id: 2, evaluated_user: 2)
@peerEval14 = PeerEval.create(score: 7, comment: "Nothing: 7/10", user_id: 1, team_id: 1, project_id: 2, evaluated_user: 3)
@peerEval15 = PeerEval.create(score: 9, comment: "Nothing: 9/10", user_id: 1, team_id: 1, project_id: 2, evaluated_user: 4)
@peerEval16 = PeerEval.create(score: 9, comment: "Nothing: 9/10", user_id: 2, team_id: 1, project_id: 2, evaluated_user: 1)
@peerEval17 = PeerEval.create(score: 10, comment: "Nothing: 10/10", user_id: 2, team_id: 1, project_id: 2, evaluated_user: 3)
@peerEval18 = PeerEval.create(score: 5, comment: "Nothing: 5/10", user_id: 3, team_id: 1, project_id: 2, evaluated_user: 1)



#User-Course relations
@user1.courses << @course1
@user1.courses << @course2
@user1.courses << @course5
@user2.courses << @course1
@user2.courses << @course2
@user2.courses << @course4
@user3.courses << @course1
@user3.courses << @course3
@user4.courses << @course1
@user5.courses << @course2
@user6.courses << @course3
@user7.courses << @course4
@user8.courses << @course5
@user9.courses << @course5
@user10.courses << @course5

@admin1.courses << @course1
@admin2.courses << @course1
@admin1.courses << @course2
@admin2.courses << @course3
@admin3.courses << @course4
@admin3.courses << @course5

#User-team relations
@team1.users << @user1
@team1.users << @user2
@team1.users << @user3
@team1.users << @user4
@team2.users << @user1
@team2.users << @user2
@team3.users << @user3
@team3.users << @user5
@team4.users << @user4
@team4.users << @user6
@team5.users << @user5
@team5.users << @user7
@team6.users << @user8
@team7.users << @user9
@team8.users << @user10


@team1.course.admins.each{|admin| @team1.users << admin.user}
@team2.course.admins.each{|admin| @team2.users << admin.user}
@team3.course.admins.each{|admin| @team3.users << admin.user}
@team4.course.admins.each{|admin| @team4.users << admin.user}
@team5.course.admins.each{|admin| @team5.users << admin.user}
@team6.course.admins.each{|admin| @team6.users << admin.user}
@team7.course.admins.each{|admin| @team7.users << admin.user}
@team8.course.admins.each{|admin| @team8.users << admin.user}

