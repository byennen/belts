# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# puts 'ROLES'
# YAML.load(ENV['ROLES']).each do |role|
#   Role.find_or_create_by_name(role)
#   puts 'role: ' << role
# end
# puts 'DEFAULT USERS'
# user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name
# user.add_role :admin

user3 = User.find_or_create_by_email :name => 'Mark', :email => 'mark.moschel@gmail.com', :password => 'testing123', :password_confirmation => 'testing123'
user3.add_role :admin

classic = Style.create(name: "classic")
skinny = Style.create(name: "skinny")

def image_url(type, style, filename)
	Rails.root.join('app', 'assets', 'images', type, style, filename).to_s
end

def pattern_url(filename)
	Rails.root.join('app', 'assets', 'images', 'pattern', filename).to_s
end

Belt.create(name: "Black", hex_color: "2D2926", style_id: 1, price_cents: 4000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'classic', '0.png'))

Belt.create(name: "Baby Blue", hex_color: "AED8EE", style_id: 1, price_cents: 4000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'classic', '1.png'))

Belt.create(name: "Blue", hex_color: "1D1F91", style_id: 1, price_cents: 4000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'classic', '2.png'))

Belt.create(name: "Brown", hex_color: "453625", style_id: 1, price_cents: 4000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'classic', '3.png'))

Belt.create(name: "Camo", hex_color: "", style_id: 1, price_cents: 4000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'classic', '24.png'),
						remote_belt_pattern_image_url: pattern_url('CF.jpg'))

Belt.create(name: "American", hex_color: "", style_id: 1, price_cents: 4000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'classic', '27.png'),
						remote_belt_pattern_image_url: pattern_url('AM.jpg'))


Buckle.create(name: "Black", hex_color: "2D2926", style_id: 1, price_cents: 500, price_currency: "USD", 
						remote_image_url: image_url('buckles', 'classic', '0.png'))

Buckle.create(name: "Baby Blue", hex_color: "84C4E5", style_id: 1, price_cents: 500, price_currency: "USD", 
						remote_image_url: image_url('buckles', 'classic', '1.png'))

Buckle.create(name: "Blue", hex_color: "1D1F91", style_id: 1, price_cents: 500, price_currency: "USD", 
						remote_image_url: image_url('buckles', 'classic', '2.png'))

Buckle.create(name: "Brown", hex_color: "5E311D", style_id: 1, price_cents: 500, price_currency: "USD", 
						remote_image_url: image_url('buckles', 'classic', '3.png'))


Belt.create(name: "Baby Blue", hex_color: "6EAED6", style_id: 2, price_cents: 3000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'skinny', '0.png'))

Belt.create(name: "Black", hex_color: "2D2926", style_id: 2, price_cents: 3000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'skinny', '1.png'))

Belt.create(name: "Hot Pink", hex_color: "E31C79", style_id: 2, price_cents: 3000, price_currency: "USD", 
						remote_image_url: image_url('belts', 'skinny', '2.png'))


Buckle.create(name: "Baby Blue", hex_color: "6EAED6", style_id: 2, price_cents: 500, price_currency: "USD", 
						remote_image_url: image_url('buckles', 'skinny', '0.png'))

Buckle.create(name: "Black", hex_color: "2D2926", style_id: 2, price_cents: 500, price_currency: "USD", 
						remote_image_url: image_url('buckles', 'skinny', '1.png'))

Buckle.create(name: "Hot Pink", hex_color: "E31C79", style_id: 2, price_cents: 500, price_currency: "USD", 
						remote_image_url: image_url('buckles', 'skinny', '2.png'))
