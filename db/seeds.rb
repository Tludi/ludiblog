# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(
  id: 1,
  name: "Ruby",
  fonticon: "diamond"
  )

Post.create(
  id: 1,
  title: "First test post",
  body: "Body text for first post",
  featuretext: "Feature text for first post",
  fonticon: "diamond",
  category_id: 1
  )