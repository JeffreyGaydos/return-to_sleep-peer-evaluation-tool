# This seed file sets up the peer evaluation file with various objects that will allow
# you to login and view various features of the tool. These objects can also be found in
# the seeds.exel file included adjacent to this file in our submission.
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Institution Objects:
@institution1 = Institution.save(name_id: "OSU")
@institution2 = Institution.save(name_id: "LSU")
@institution3 = Institution.save(name_id: "Xichigan")

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
@instructor1 = User.save(name: "Instructor1", email: "instructor1@example.com", password: "Something", password_confirmation: "Something")
@admin1 = Admin.new(user: @instructor1, user_id: @instructor1.id, institution: @institution1, institution_id: @institution1.id)
@instructor2 = User.save(name: "Instructor2", email: "instructor2@example.com", password: "Something", password_confirmation: "Something")
@admin2 = Admin.new(user: @instructor2, user_id: @instructor2.id, institution: @institution2, institution_id: @institution2.id)
@instructor3 = User.save(name: "Instructor3", email: "instructor3@example.com", password: "Something", password_confirmation: "Something")
@admin3 = Admin.new(user: @instructor3, user_id: @instructor3.id, institution: @institution3, institution_id: @institution3.id)

# Courses
@course1 = Course.new(name: "Web Apps 1", class_number: 3901)
@course2 = Course.new(name: "Web Apps 2", class_number: 3902)
@course3 = Course.new(name: "Web Apps 3", class_number: 3903)
@course4 = Course.new(name: "Web Apps 4", class_number: 3904)
@course5 = Course.new(name: "Web Apps 5", class_number: 3905)

# Teams
@team1 = Team.new(name: "Team 1", course: @course1)
@team3 = Team.new(name: "Team 2", course: @course1)
@team2 = Team.new(name: "Team 3", course: @course1)
@team4 = Team.new(name: "Team 4", course: @course2)
@team5 = Team.new(name: "Team 5", course: @course2)
@team6 = Team.new(name: "Team 6", course: @course3)
@team7 = Team.new(name: "Team 7", course: @course4)
@team8 = Team.new(name: "Team 8", course: @course5)

