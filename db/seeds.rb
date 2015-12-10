# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "admin",
			 email: "admin@gmail.com",
			 password: "ingenieria.2015",
			 password_confirmation: "ingenieria.2015",
			 activated:	true,
			 admin: true,
			 premium: true,
			 activated_at: Time.zone.now)
User.create!(name: "angelicabufartanelo",
			 email: "angelicabufartanelo@gmail.com",
			 password: "ingenieria.2015",
			 password_confirmation: "ingenieria.2015",
			 activated:	true,
			 admin: true,
			 premium: true,
			 activated_at: Time.zone.now)
User.create!(name: "usuariopremium.couchinn",
			 email: "usuariopremium.couchinn@gmail.com",
			 password: "ingenieria.2015",
			 password_confirmation: "ingenieria.2015",
			 activated:	true,
			 admin: false,
			 premium: true,
			 activated_at: Time.zone.now)
User.create!(name: "usuarioregistrado.couchinn",
			 email: "usuarioregistrado.couchinn@gmail.com",
			 password: "ingenieria.2015",
			 password_confirmation: "ingenieria.2015",
			 activated:	true,
			 admin: false,
			 premium: false,
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
users = User.order(:created_at).take(6)
50.times do
	content = Faker::Lorem.sentence(5)
	users.each { |user| user.user_feedbacks.create!(content: content) }
end