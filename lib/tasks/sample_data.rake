namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_entries
    make_relationships
<<<<<<< HEAD
    make_comments
=======
>>>>>>> 777be37199531d070edbdd3895c3ec9af4d55a4f
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
<<<<<<< HEAD
  50.times do |n|
=======
  99.times do |n|
>>>>>>> 777be37199531d070edbdd3895c3ec9af4d55a4f
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_entries
<<<<<<< HEAD
  users = User.all(limit: 5)
    30.times do |n|
=======
  users = User.all(limit: 6)
    50.times do |n|
>>>>>>> 777be37199531d070edbdd3895c3ec9af4d55a4f
      title = "Title Example - #{n}"
      body = Faker::Lorem.sentence(5)
      users.each { |user| user.entries.create!(title: title, body: body)}
    end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
<<<<<<< HEAD
end

def make_comments
  entries = Entry.all(limit:9)
  user = User.first
  5.times do |n|
    content = "content-#{n+1} this is comment"
    entries.each { |entry| entry.comments.create!(content: content,
                                 user_id: user.id,
                                 entry_id: entry.id) }
  end
end

# def make_comments
#   users = User.all(limit: 6)
#   entries = Entry.all(limit: 6)
#     entries.each do
#       users.each do
#         content = "Comment --- "
#         entries.each { |entry| user.comments.create!(content: content,
#                                     user_id: user.id,
#                                     entry_id: entry.id)}
#       end
#     end
# end
=======
end
>>>>>>> 777be37199531d070edbdd3895c3ec9af4d55a4f
