# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

['mens_fashion', 'womens_fashion', 'childrens_fashion'].each do |key_name|
  Preference.find_or_create_by(key_name: key_name)
end