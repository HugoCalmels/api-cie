# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new(
  email: "gaelle.boucherit@gmail.com",
  password: "YDceh&23a!grFAMZ"
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


1.times do 
  dc = DessinCategory.create(title: "Exemple titre")

  3.times do 
    d = Dessin.new(
      title: "Exemple titre",
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

1.times do 
  dc = PaysageCategory.create(title: "Exemple titre")
  3.times do 
    d = Paysage.new(
      title: "Exemple titre",
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

1.times do 
  dc = CarnetCategory.create(title: "Exemple titre")
  3.times do 
    d = Carnet.new(
      title: "Exemple titre",
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

## SEED PHOTOS 

1.times do 
  dc = PhotoCategory.create(title: "Exemple titre")

  3.times do 
    d = Photo.new(
      title: "Exemple titre",
      image_url: images_array[rand(1..50)]["image_link"],
      photo_category_id: dc.id,
      ref: rand(1..1000),
      width: rand(10..100),
      height: rand(10..100),
      material: Faker::Vehicle.manufacture
      )
    d.save
  end
end

puts "%%%%%%%%%%%%%%%% DATABASE REMPLIE AVEC SUCCESS %%%%%%%%%%%%%%%%%%%%%%%"

