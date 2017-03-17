Photo.delete_all
Category.delete_all
Registration.delete_all
Event.delete_all
Profile.delete_all
User.delete_all

category1 = Category.create(name: "Birthday party")
category2 = Category.create(name: "Dance party")
category3 = Category.create(name: "Wine tasting")
category4 = Category.create(name: "Kids event")

user1 = User.create(email: "timmy@up.com", password: "yay1234")
user2 = User.create(email: "tommy@up.com", password: "yay1234")


photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/doei2x1xz/image/upload/v1489671140/red_carpet_v07jdj.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/doei2x1xz/image/upload/v1489671140/bg-slide-01_x57tqf.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/doei2x1xz/image/upload/v1489663161/sample.jpg")

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
 categories: [category1], photos: [photo1, photo2, photo3])

registration1 = Registration.create(user: user1, event: event1, price: 10, status: "yay", guest_count: 2)
