require "open-uri"

if Rails.env.development?
  puts "Deleting data"
  Review.destroy_all
  My_Job.destroy_all
  Job.destroy_all
  User.destroy_all
  puts "Data deleted successfully"
 end

puts "Creating users"
user1 = User.create!(nickname: "Victoria", email: "vicky@gmail.com", password: "123456")
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673618845/pqxbv0ljsueied2qgx8m.jpg")
user1.photo.attach(io: file, filename: "vicky.png", content_type: "image/png")
user1.save
puts "#{user1.name} created successfully"

user2 = User.create!(nickname: "Nica", email: "nica@gmail.com", password: "123456")
file = URI.open("https://avatars.githubusercontent.com/u/122623098?v=4")
user2.photo.attach(io: file, filename: "nica.png", content_type: "image/png")
user2.save
puts "#{user2.name} created successfully"

user3 = User.create!(nickname: "Fernando", email: "fernando@gmail.com", password: "123456")
file = URI.open("https://avatars.githubusercontent.com/u/108149366?v=4")
user3.photo.attach(io: file, filename: "fdo.png", content_type: "image/png")
user3.save
puts "#{user3.name} created successfully"

job1 = Job.create!(name: "La carnecita roja y el lomo feroz", address: "Av. La Florida 3567", specialty: "Carne asada", description: "La mejor carne asada de la ciudad, ven a disfrutar con nosotros todas la variedades de platos", user: user1)

file = URI.open("https://www.eltiempo.com/files/image_640_428/uploads/2022/11/11/636ec9b036dfd.png")
restaurant1.photo.attach(io: file, filename: "r1.png", content_type: "image/png")
restaurant1.save

job2 = Job.create!(name: "Los tres cerditos al spiedo", address: "Av. Bernardo O'higgins 1267", specialty: "Carnes premium", description: "Deleita a tu paladar con las mejores carnes premium de cerdo, vacuno y guayu", user: user1)

file = URI.open("https://foodandpleasure.com/wp-content/uploads/2018/06/piantao-3.jpg")
restaurant2.photo.attach(io: file, filename: "r2.png", content_type: "image/png")
restaurant2.save

job3 = Restaurant.create!(name: "我是王 - Yo soy wang ", address: "Av. Recoleta 3500, Santiago", specialty: "Comida China", description: "Comida tradicional china cantonesa", user: user2)
