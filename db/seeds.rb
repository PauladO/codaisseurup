Category.destroy_all
User.destroy_all

user1 = User.create(email: "timmy@up.com", password: "yay1234")

category1 = Category.create(name: "Birthday party")
category2 = Category.create(name: "Dance party")
category3 = Category.create(name: "Wine tasting")
category4 = Category.create(name: "Kids event")



event1 = Event.create(name: "Funtimes",
 description: "It's funtimes! yay!",
 location: "here",
 price: 12.50,
 capacity: 50,
 includes_food: true,
 includes_drinks: true,
 starts_at: DateTime.new(2017,4,3,12,0,0),
 ends_at: DateTime.new(2017,4,3,15,0,0),
 active: true,
 user: user1,
 categories: [category1])
