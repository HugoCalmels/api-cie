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
Type.create(label: "profil", title: "Qui est Gaëlle ?", desc: Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false))
Type.create(label: "work", title: "Quel est son travail ?", desc: Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false))
Type.create(label: "product", title: "A quoi ressemble un produit ?", desc: Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false))

# Images index /blog -- CARROUSEL

5.times do
  h = Home.new(
  image_url: images_array[rand(1..50)]["image_link"],
  type_id: 1
)
h.save

end

# Images index /blog -- ALL OTHERS
Home.create(
  image_url: images_array[rand(1..50)]["image_link"],
  type_id: 2
)
Home.create(
  image_url: images_array[rand(1..50)]["image_link"],
  type_id: 3
)
Home.create(
  image_url: images_array[rand(1..50)]["image_link"],
  type_id: 4
)

## SEED DES IMAGES GALERIES


10.times do 
  dc = DessinCategory.create(title: Faker::Artist.name)

  100.times do 
    d = Dessin.new(
      title: Faker::Color.color_name,
      image_url: images_array[rand(1..50)]["image_link"],
      dessin_category_id: dc.id,
      ref: rand(1..1000),
      width: rand(10..100),
      height: rand(10..100),
      material: Faker::Vehicle.manufacture
      )
    d.save
  end
end

10.times do 
  dc = PaysageCategory.create(title: Faker::Artist.name)
  100.times do 
    d = Paysage.new(
      title: Faker::Color.color_name,
      image_url: images_array[rand(1..50)]["image_link"],
      paysage_category_id: dc.id,
      ref: rand(1..1000),
      width: rand(10..100),
      height: rand(10..100),
      material: Faker::Vehicle.manufacture
      )
    d.save
  end
end

10.times do 
  dc = CarnetCategory.create(title: Faker::Artist.name)
  100.times do 
    d = Carnet.new(
      title: Faker::Color.color_name,
      image_url: images_array[rand(1..50)]["image_link"],
      carnet_category_id: dc.id,
      ref: rand(1..1000),
      width: rand(10..100),
      height: rand(10..100),
      material: Faker::Vehicle.manufacture
      )
    d.save
  end
end


puts "%%%%%%%%%%%%%%%% DATABASE REMPLIE AVEC SUCCESS %%%%%%%%%%%%%%%%%%%%%%%"

