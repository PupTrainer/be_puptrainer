User.destroy_all
Dog.destroy_all

user1 = User.create!(username: 'brisket_enthusiast', email: 'steak@meats.com')

dog1 = Dog.create!(name: 'skeeter', age: 2, breed: 'cardigan welsch corgi', user_id: user1.id)