# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Article.destroy_all
Tag.destroy_all

12.times do |i|
  Category.create(name: Faker::Hipster.words(1)[0].downcase)
end

10.times { Tag.create(name: Faker::Pokemon.name)}

25.times do
  article_hash = {
    title: Faker::Commerce.product_name,
    description: "#{Faker::HarryPotter.quote} #{Faker::HarryPotter.quote} #{Faker::HarryPotter.quote}",
    email: Faker::Internet.safe_email,
    price: Faker::Commerce.price,
    zip_code: Faker::Address.zip,
    edit_id: SecureRandom.hex(6),
    category_id: rand(Category.all.count)
  }
  Article.create(article_hash)
end
