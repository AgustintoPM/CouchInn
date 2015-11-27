# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "adminangelica",
			 email: "angelicabufartanelo@gmail.com",
			 password: "123456789",
			 password_confirmation: "123456789",
			 activated:	true,
			 admin: true,
			 premium: true,
			 credit_card: "1111222233334444",
			 activated_at: Time.zone.now)
70.times do |n|
		name = Faker::Name.name
		email = "#{n+1}@gmail.org"
		password = "123456789"
		User.create!(name: name,
					email: email,
					password: password,
					password_confirmation: password,
					admin: false,
					premium: false,
					activated:	true,
					activated_at: Time.zone.now)
end