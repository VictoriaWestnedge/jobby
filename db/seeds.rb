require "open-uri"

if Rails.env.development?
  puts "Deleting data"
  Review.destroy_all
  MyJob.destroy_all
  Job.destroy_all
  User.destroy_all
  puts "Data deleted successfully"
 end

puts "Creating users"
user1 = User.create!(nickname: "Victoria", email: "vicky@gmail.com", password: "123456")
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673618845/pqxbv0ljsueied2qgx8m.jpg")
user1.photo.attach(io: file, filename: "vicky.png", content_type: "image/png")
user1.save
puts "#{user1.nickname} created successfully"

user2 = User.create!(nickname: "Nica", email: "nica@gmail.com", password: "123456")
file = URI.open("https://avatars.githubusercontent.com/u/122623098?v=4")
user2.photo.attach(io: file, filename: "nica.png", content_type: "image/png")
user2.save
puts "#{user2.nickname} created successfully"

user3 = User.create!(nickname: "Fernando", email: "fernando@gmail.com", password: "123456")
file = URI.open("https://avatars.githubusercontent.com/u/108149366?v=4")
user3.photo.attach(io: file, filename: "fdo.png", content_type: "image/png")
user3.save
puts "#{user3.nickname} created successfully"

job1 = Job.create!(name: "Painting my first floor", description: "I need help with redecorating my first floor, sitting room and kitchen", category: 1, address: "Av. La Florida 3567", city: "Santiago", qty_hour: 5, price_per_hour: 15, start_date: Date.new(2023,4,1), end_date: Date.new(2023,4,1), start_time: Time.now.strftime("10:00:00"), end_time: Time.now.strftime("15:00:00"), user: user1)

# file = URI.open("https://pinturashipopotamo.es/wp-content/uploads/2020/01/como-elegir-un-buen-pintor.jpg")
# job1.photo.attach(io: file, filename: "r1.png", content_type: "image/png")

job2 = Job.create!(name: "Babysitter needed", description: "I am looking for a babysitter to look after my 4 year old girl", category: 2, address: "Av. Bernardo O'higgins 1267", city: "Santiago", qty_hour: 4, price_per_hour: 30, start_date: Date.new(2023,3,15), end_date: Date.new(2023,3,15), start_time: Time.now.strftime("19:00:00"), end_time: Time.now.strftime("23:00:00"), user: user1)

# file = URI.open("https://heritagevalleyfcu.org/wp-content/uploads/2019/09/shutterstock_552072628-e1595863177777.jpg")
# job2.photo.attach(io: file, filename: "r2.png", content_type: "image/png")

job3 = Job.create!(name: "Delivery of packages", description: "Looking for someone that can deliver some heavy boxes to my office", category: 3, address: "Av. Recoleta 3500", city: "Valparaiso", qty_hour: 2, price_per_hour: 20, start_date: Date.new(2023,3,20), end_date: Date.new(2023,3,20), start_time: Time.now.strftime("16:00:00"), end_time: Time.now.strftime("18:00:00"), user: user2)
# file = URI.open("https://freedesignfile.com/upload/2018/10/Smiling-young-delivery-guy-Stock-Photo-04.jpg")
# job3.photo.attach(io: file, filename: "r3.png", content_type: "image/png")


