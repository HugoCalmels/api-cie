# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new(
  email: "admin@gmail.com",
  password: "123123"
)
u.save

images = RestClient.get("https://api-images-seeder-rails.herokuapp.com/post_images")
images_array = JSON.parse(images)



# Types index/blog
Type.create(label: "carrousel")
Type.create(label: "profil", title: "Qui est Gaëlle ?")
Type.create(label: "work", title: "Quel est son travail ?")
Type.create(label: "product", title: "A quoi ressemble un produit ?")

# Images index /blog -- CARROUSEL
index = 1
5.times do
  h = Home.new(
  image_url: images_array[index]["image_link"],
  type_id: 1
)
h.save
index += 1
end

# Images index /blog -- ALL OTHERS
Home.create(
  image_url: images_array[1]["image_link"],
  type_id: 2
)
Home.create(
  image_url: images_array[1]["image_link"],
  type_id: 3
)
Home.create(
  image_url: images_array[1]["image_link"],
  type_id: 4
)

puts "%%%%%%%%%%%%%%%% DATABASE REMPLIE AVEC SUCCESS %%%%%%%%%%%%%%%%%%%%%%%"

