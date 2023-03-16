require "open-uri"

  puts "Deleting data"
  Meeting.destroy_all
  Review.destroy_all
  MyJob.destroy_all
  Job.destroy_all
  Message.destroy_all
  User.destroy_all
  puts "Data deleted successfully"

puts "Creating users"
user1 = User.new(nickname: "Victoria", email: "vicky@gmail.com", password: "123456")
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673618845/pqxbv0ljsueied2qgx8m.jpg")
user1.photo.attach(io: file, filename: "vicky.png", content_type: "image/png")
user1.save
puts "#{user1.nickname} created successfully"

user2 = User.new(nickname: "Nica", email: "nica@gmail.com", password: "123456")
file = URI.open("https://avatars.githubusercontent.com/u/122623098?v=4")
user2.photo.attach(io: file, filename: "nica.png", content_type: "image/png")
user2.save
puts "#{user2.nickname} created successfully"

user3 = User.new(nickname: "Fernando", email: "fernando@gmail.com", password: "123456", rating:4)
file = URI.open("https://avatars.githubusercontent.com/u/108149366?v=4")
user3.photo.attach(io: file, filename: "fdo.png", content_type: "image/png")
user3.save
puts "#{user3.nickname} created successfully"

user4 = User.new(nickname: "Andres", email: "andres@gmail.com", password: "123456")
file = URI.open("https://avatars.githubusercontent.com/u/47392684?v=4")
user4.photo.attach(io: file, filename: "andres.png", content_type: "image/png")
user4.save
puts "#{user4.nickname} created successfully"

user5 = User.new(nickname: "Cecilia", email: "cecilia@gmail.com", password: "123456")
file = URI.open("https://avatars.githubusercontent.com/u/73177352?v=4")
user5.photo.attach(io: file, filename: "ceci.png", content_type: "image/png")
user5.save
puts "#{user5.nickname} created successfully"

job1 = Job.new(name: "Pintando mi primer piso", description: "Necesito ayuda para redecorar mi primer piso, sala de estar y cocina. Me gustaría un cambio de color en las paredes y algunos consejos de decoración", category: "Painting", address: "Av. La Florida 3567", city: "Santiago", qty_hour: 5, price_per_hour: 15, start_date: Date.new(2023,4,1), end_date: Date.new(2023,4,1), start_time: Time.now.strftime("10:00:00"), end_time: Time.now.strftime("15:00:00"), user: user1)
# job1 = Job.new(name: "Painting my first floor", description: "I need help with redecorating my first floor, sitting room and kitchen", category: "Painting", address: "Av. La Florida 3567", city: "Santiago", qty_hour: 5, price_per_hour: 15, start_date: Date.new(2023,4,1), end_date: Date.new(2023,4,1), start_time: Time.now.strftime("10:00:00"), end_time: Time.now.strftime("15:00:00"), user: user1)
file = URI.open("https://pinturashipopotamo.es/wp-content/uploads/2020/01/como-elegir-un-buen-pintor.jpg")
job1.photo.attach(io: file, filename: "j1.png", content_type: "image/png")
job1.save

job2 = Job.new(name: "Necesito niñera", description: "Estoy buscando una niñera para cuidar a mi niña de 4 años. Ella es muy activa y le encanta jugar, así que necesito a alguien que pueda mantenerla entretenida y a salvo mientras estoy fuera", category: "Babysitting", address: "Blest Gana 5888", city: "Santiago", qty_hour: 4, price_per_hour: 30, start_date: Date.new(2023,3,15), end_date: Date.new(2023,3,15), start_time: Time.now.strftime("19:00:00"), end_time: Time.now.strftime("23:00:00"), user: user1)
# job2 = Job.new(name: "Babysitter needed", description: "I am looking for a babysitter to look after my 4 year old girl", category: "Babysitting", address: "Blest Gana 5888", city: "Santiago", qty_hour: 4, price_per_hour: 30, start_date: Date.new(2023,3,15), end_date: Date.new(2023,3,15), start_time: Time.now.strftime("19:00:00"), end_time: Time.now.strftime("23:00:00"), user: user1)
file = URI.open("https://heritagevalleyfcu.org/wp-content/uploads/2019/09/shutterstock_552072628-e1595863177777.jpg")
job2.photo.attach(io: file, filename: "j2.png", content_type: "image/png")
job2.save

job3 = Job.new(name: "Entrega de paquetes", description: "Busco a alguien que pueda entregar algunas cajas pesadas en mi oficina. Debe tener un vehículo adecuado para transportar las cajas y ser responsable en la entrega a tiempo", category: "Deliveries", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 2, price_per_hour: 20, start_date: Date.new(2023,3,20), end_date: Date.new(2023,3,20), start_time: Time.now.strftime("16:00:00"), end_time: Time.now.strftime("18:00:00"), user: user2)
#job3 = Job.new(name: "Delivery of packages", description: "Looking for someone that can deliver some heavy boxes to my office", category: "Deliveries", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 2, price_per_hour: 20, start_date: Date.new(2023,3,20), end_date: Date.new(2023,3,20), start_time: Time.now.strftime("16:00:00"), end_time: Time.now.strftime("18:00:00"), user: user3)
file = URI.open("https://freedesignfile.com/upload/2018/10/Smiling-young-delivery-guy-Stock-Photo-04.jpg")
job3.photo.attach(io: file, filename: "j3.png", content_type: "image/png")
job3.save

job4 = Job.new(name: "Cuidado de mi perro", description: "Busco a alguien que cuide a mi perra Leia durante el fin de semana. Necesito que la alimenten, paseen y le hagan compañía mientras estoy fuera de casa", category: "Petsitting", address: "Av. Jorge Montt 11700", city: "Talcahuano", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user1)
# job4 = Job.new(name: "Petsitting my dog", description: "Looking for someone to look after my dog Leia for the weekend", category: "Petsitting", address: "Av. Jorge Montt 11700", city: "Talcahuano", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user3)
file = URI.open("https://bloximages.chicago2.vip.townnews.com/eacourier.com/content/tncms/assets/v3/editorial/5/11/51146d02-bc2f-11ed-a460-d7bbde0df6e7/6406000e42d69.image.jpg")
job4.photo.attach(io: file, filename: "j4.png", content_type: "image/png")
job4.save

job5 = Job.new(name: "Limpieza de casa", description: "Necesito ayuda para organizar y limpiar mi casa después de mudarme. Sería ideal contar con alguien que me ayude en limpieza y organización de espacios", category: "Cleaning", address: "Av. La Florida 3567", city: "Santiago", qty_hour: 6, price_per_hour: 15, start_date: Date.new(2023,3,25), end_date: Date.new(2023,3,25), start_time: Time.now.strftime("09:00:00"), end_time: Time.now.strftime("15:00:00"), user: user4)
# job5 = Job.new(name: "Cleaning house", description: "Help to organize and clean my house after moving in", category: "Cleaning", address: "Av. La Florida 3567", city: "Santiago", qty_hour: 6, price_per_hour: 15, start_date: Date.new(2023,3,25), end_date: Date.new(2023,3,25), start_time: Time.now.strftime("09:00:00"), end_time: Time.now.strftime("15:00:00"), user: user4)
file = URI.open("https://www.familyhandyman.com/wp-content/uploads/2022/08/GettyImages-562452123.jpg")
job5.photo.attach(io: file, filename: "j5.png", content_type: "image/png")
job5.save

job6 = Job.new(name: "Recoger comida", description: "Necesito que alguien recoja la comida de mi perro en el centro de la ciudad y la entregue en mi casa. Sería ideal si tienen experiencia en entregas y conocen bien la ciudad", category: "Deliveries", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 2, price_per_hour: 8, start_date: Date.new(2023,4,1), end_date: Date.new(2023,4,1), start_time: Time.now.strftime("09:00:00"), end_time: Time.now.strftime("10:00:00"), user: user4)
# job6 = Job.new(name: "Pick up dog food", description: "I need someone to pick-up my dog food from the city centre", category: "Deliveries", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 2, price_per_hour: 8, start_date: Date.new(2023,4,1), end_date: Date.new(2023,4,1), start_time: Time.now.strftime("09:00:00"), end_time: Time.now.strftime("10:00:00"), user: user4)
file = URI.open("https://media-be.chewy.com/wp-content/uploads/2017/10/23164230/fresh-dog-food-1024x615.jpg")
job6.photo.attach(io: file, filename: "j6.png", content_type: "image/png")
job6.save

job7 = Job.new(name: "Ensamble de muebles", description: "Por favor, ayuda a armar una cuna para mi sobrina. Necesito a alguien quien me ayude en el ensamble de muebles y que cuente con las herramientas necesarias para realizar el trabajo de manera eficiente y segura", category: "Others", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 3, price_per_hour: 12, start_date: Date.new(2023,4,10), end_date: Date.new(2023,4,10), start_time: Time.now.strftime("11:00:00"), end_time: Time.now.strftime("13:00:00"), user: user4)
# job7 = Job.new(name: "Furniture assembly", description: "Please help assemble a cot for my niece", category: "Others", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 3, price_per_hour: 12, start_date: Date.new(2023,4,10), end_date: Date.new(2023,4,10), start_time: Time.now.strftime("11:00:00"), end_time: Time.now.strftime("13:00:00"), user: user4)
file = URI.open("https://www.roomtogrow.co.uk/product_images/uploaded_images/furniture.jpg")
job7.photo.attach(io: file, filename: "j7.png", content_type: "image/png")
job7.save

job8 = Job.new(name: "Cuidando a mi hijo", description: "Busco a alguien para cuidar a mi hijo Alexander.Le guste  el cuidado de niños, que sea paciente y cariñoso. Debe estar dispuesto a darle de comer y mantenerlo entretenido mientras esté despierto", category: "Babysitting", address: "Ramón Cruz Montt 2895", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user4)
# job8 = Job.new(name: "Babysitting my son", description: "Looking for someone to look after my baby Alexander", category: "Babysitting", address: "Ramón Cruz Montt 2895", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user4)
file = URI.open("https://ichef.bbci.co.uk/news/976/cpsprodpb/11B4A/production/_128622527_cairo.jpg")
job8.photo.attach(io: file, filename: "j8.png", content_type: "image/png")
job8.save

job9 = Job.new(name: "Cuidar a mi perro", description: "Busco a alguien para cuidar a mi perro Princesa. Necesito a alguien amante de los animales, responsable y con experiencia en el cuidado de perros. Deberá alimentarla, sacarla a pasear y darle atención y cariño mientras no esté en casa", category: "Petsitting", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
# job9 = Job.new(name: "Look after my dog", description: "Looking for someone to look after my dog Princessa", category: "Petsitting", address: "Av. Los Pajaritos 3271", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
file = URI.open("https://paradepets.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkxMzY1Nzg4NjczMzIwNTQ2/cutest-dog-breeds-jpg.jpg")
job9.photo.attach(io: file, filename: "j9.png", content_type: "image/png")
job9.save

job10 = Job.new(name: "Organizando mi garaje", description: "He estado ordenando y necesito ayuda para organizar y limpiar mi garaje. Necesito a alguien con habilidades de organización y que pueda levantar objetos pesados para acomodar las cosas de manera eficiente y ordenada", category: "Cleaning", address: "Nuncio Laghi 6724", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
# job10 = Job.new(name: "Organizing my garage", description: "I have been doing a sort out and need some help tidying my garage", category: "Cleaning", address: "Nuncio Laghi 6724", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
file = URI.open("https://thecleanhaven.com/wp-content/uploads/2019/09/clean-house.jpeg")
job10.photo.attach(io: file, filename: "j10.png", content_type: "image/png")
job10.save

job11 = Job.new(name: "Entregas al almacén", description: "Necesito a alguien con un auto para entregar algunas cajas en mi almacén. Debe tener experiencia en la conducción y ser capaz de cargar y descargar cajas de manera eficiente y sin dañar los productos", category: "Deliveries", address: "Ramón Cruz Montt 2895", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
# job11 = Job.new(name: "Deliveries to warehouse", description: "Need someone with a car to deliver some boxes to my warehouse", category: "Deliveries", address: "Ramón Cruz Montt 2895", city: "Santiago", qty_hour: 12, price_per_hour: 10, start_date: Date.new(2023,3,18), end_date: Date.new(2023,3,19), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
file = URI.open("https://www.vanvault.co.uk/media/catalog/product/cache/1/overlay_image/285x/9df78eab33525d08d6e5fb8d27136e95/v/a/van_vault_stacker_xl-app.jpg")
job11.photo.attach(io: file, filename: "j11.png", content_type: "image/png")
job11.save

job12 = Job.new(name: "Cuidado de gatos", description: "Me voy de viaje el fin de semana y necesito que alguien cuide a mis gatos. Es importante que la persona sea amable, responsable y tenga experiencia en el cuidado de animales, especialmente gatos. Se espera que la persona encargada alimente a los gatos, limpie sus areneros y les haga compañía durante las horas asignadas.", category: "Petsitting", address: "Nuncio Laghi 6724", city: "Santiago", qty_hour: 12, price_per_hour: 5, start_date: Date.new(2023,3,25), end_date: Date.new(2023,3,26), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
# job12 = Job.new(name: "Cat sitting overnight", description: "I am going away for the weekend and need someone to look after my cats", category: "Petsitting", address: "Nuncio Laghi 6724", city: "Santiago", qty_hour: 12, price_per_hour: 5, start_date: Date.new(2023,3,25), end_date: Date.new(2023,3,26), start_time: Time.now.strftime("20:00:00"), end_time: Time.now.strftime("08:00:00"), user: user5)
file = URI.open("https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg")
job12.photo.attach(io: file, filename: "j12.png", content_type: "image/png")
job12.save

puts "Jobs created successfully"

review1 = Review.create!(rating_star: 4, description: "Muy buen trabajo, estoy bastante satisfecho", user: user3, created_at: Date.new(2023,03,15))
review2 = Review.create!(rating_star: 5, description: "Excelente atención al cliente, muy profesional", user: user3, created_at: Date.new(2023,03,01))
review4 = Review.create!(rating_star: 5, description: "Increíble experiencia, lo recomiendo ampliamente", user: user3, created_at: Date.new(2023,01,10))
review5 = Review.create!(rating_star: 4, description: "Muy satisfecho, aunque podría mejorar un poco en el servicio", user: user3, created_at: Date.new(2022,4,28))
review6 = Review.create!(rating_star: 5, description: "Simplemente genial, superó mis expectativas", user: user3, created_at: Date.new(2022,8,18))
review7 = Review.create!(rating_star: 4, description: "Buen trabajo, pero hay espacio para mejorar", user: user3, created_at: Date.new(2022,11,12))
review8 = Review.create!(rating_star: 5, description: "Servicio de primera, sin duda volveré", user: user3, created_at: Date.new(2022,5,30))
review9 = Review.create!(rating_star: 4, description: "Servicio de calidad", user: user3, created_at: Date.new(2022,9,25))

review11 = Review.create!(rating_star: 4, description: "Gran atención, aunque podría ser más rápida", user: user3, created_at: Date.new(2022,7,23))
review12 = Review.create!(rating_star: 5, description: "Muy contento con la calidad del servicio", user: user3, created_at: Date.new(2022,10,19))
review13 = Review.create!(rating_star: 4, description: "Buena experiencia", user: user3, created_at: Date.new(2022,2,16))
review14 = Review.create!(rating_star: 5, description: "Inmejorable servicio, rápido y eficiente", user: user3, created_at: Date.new(2022,8,6))
# review1 = Review.create!(rating_star: 5, description: "Excellent job, really happy with her work", user: user2, created_at: Date.new(2022,12,1))

# review2 = Review.create!(rating_star: 4, description: "Very happy with Nica's work, great painting", user: user2, created_at: Date.new(2023,01,10))

# review3 = Review.create!(rating_star: 4, description: "So pleased with how everything turned out", user: user2, created_at: Date.new(2023,01,19))

# review4 = Review.create!(rating_star: 3, description: "Ok work, but she seemed in a bit of a rush", user: user2, created_at: Date.new(2023,01,23))

# review5 = Review.create!(rating_star: 2, description: "She arrived late and didn't finish everything", user: user2, created_at: Date.new(2023,02,07))

# review6 = Review.create!(rating_star: 4, description: "Great work, would love to work with her again!", user: user2, created_at: Date.new(2023,03,01))

# review7 = Review.create!(rating_star: 5, description: "Can't be happier, she did an amazing job painting", user: user2, created_at: Date.new(2023,03,15))

puts "reviews created successfully"

puts "Creating Chatroom"
  Chatroom.create(name: "general")
