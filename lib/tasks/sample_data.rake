# namespace :db do
#   desc "Fill database with sample data"
#   task populate: :environment do
#     User.create!(first_name: "Sergey",
#                  last_name: "Skumatov",
#                  email: "example@railstutorial.org",
#                  password: "Password_2016",
#                  password_confirmation: "Password_2016")
#     99.times do |n|
#       first_name  = Faker::Name.first_name
#       last_name  = Faker::Name.last_name
#       email = "example-#{n+1}@railstutorial.org"
#       password  = "Password_2016"
#       User.create!(first_name: first_name,
#                    last_name: last_name,
#                    email: email,
#                    password: password,
#                    password_confirmation: password)
#     end
# end
#   users = User.all(limit: 6)
#   # users = User.order(:created_at).take(6)
#   50.times do
#     content = Faker::Lorem.sentence(5)
#     users.each { |user| user.microposts.create!(content: content) }
#     end
#   end
#
