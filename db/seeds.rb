puts 'ROLES'
if ENV['ROLES']
  YAML.load(ENV['ROLES']).each do |role|
     Role.find_or_create_by_name(role)
     puts 'role: ' << role
  end
  puts 'DEFAULT USERS'
  user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
  puts 'user: ' << user.name
  user.add_role :admin
end

user3 = User.find_or_create_by_email :name => 'Mark', :email => 'mark.moschel@gmail.com', :password => 'testing123', :password_confirmation => 'testing123'
user3.add_role :admin

puts 'ADDING STYLES: classic and skinny'
classic = Style.create(name: "classic")
skinny = Style.create(name: "skinny")

def image_url(type, style, filename)
  Rails.root.join('app', 'assets', 'images', type, style, filename).to_s
end

def pattern_url(filename)
  Rails.root.join('app', 'assets', 'images', 'pattern', filename).to_s
end

###################
## CLASSIC BELTS ##
################### 
puts 'ADDING CLASSIC BELTS'

Belt.create(name: "Black", hex_color: "2D2926", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '0.png'))

Belt.create(name: "Baby Blue", hex_color: "AED8EE", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '1.png'))

Belt.create(name: "Blue", hex_color: "1D1F91", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '2.png'))

Belt.create(name: "Brown", hex_color: "453625", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '3.png'))

Belt.create(name: "Burnt Orange", hex_color: "D46710", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '4.png'))

Belt.create(name: "Forest Green", hex_color: "113E00", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '5.png'))

Belt.create(name: "Green", hex_color: "44D62C", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '6.png'))

Belt.create(name: "Grey", hex_color: "53565A", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '7.png'))

Belt.create(name: "Hot Pink", hex_color: "E31C79", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '8.png'))

Belt.create(name: "Khaki", hex_color: "ECD898", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '9.png'))

Belt.create(name: "Lavender", hex_color: "D2A3CA", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '10.png'))

Belt.create(name: "Lime", hex_color: "84BD00", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '11.png'))

Belt.create(name: "Maroon", hex_color: "76232F", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '12.png'))

Belt.create(name: "Navy", hex_color: "13294B", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '13.png'))

Belt.create(name: "Neon Yellow", hex_color: "F3F315", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '14.png'))

Belt.create(name: "Olive", hex_color: "59621D", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '15.png'))

Belt.create(name: "Orange", hex_color: "FF8F1A", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '16.png'))

Belt.create(name: "Pink", hex_color: "FFA3B5", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '17.png'))

Belt.create(name: "Plum", hex_color: "67476A", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '18.png'))

Belt.create(name: "Red", hex_color: "ED1F1E", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '19.png'))

Belt.create(name: "Sky Blue", hex_color: "05C3DE", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '20.png'))

Belt.create(name: "Turquoise", hex_color: "2CD5C4", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '21.png'))

Belt.create(name: "White", hex_color: "FFFFFF", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '22.png'))

Belt.create(name: "Yellow", hex_color: "FEE528", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '23.png'))

Belt.create(name: "Camo", hex_color: "", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '24.png'),
  remote_belt_pattern_image_url: pattern_url('CF.jpg'))

Belt.create(name: "Honeycomb", hex_color: "", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '25.png'),
  remote_belt_pattern_image_url: pattern_url('HC.jpg'))

Belt.create(name: "Swirl", hex_color: "", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '26.png'),
  remote_belt_pattern_image_url: pattern_url('SW.jpg'))

Belt.create(name: "American", hex_color: "", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '27.png'),
  remote_belt_pattern_image_url: pattern_url('AM.jpg'))

Belt.create(name: "Glow", hex_color: "", style_id: 1, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'classic', '28.png'),
  remote_belt_pattern_image_url: pattern_url('glow.jpg'))


#####################
## CLASSIC BUCKLES ##
#####################
puts 'ADDING CLASSIC BUCKLES'

Buckle.create(name: "Black", hex_color: "2D2926", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '0.png'))

Buckle.create(name: "Baby Blue", hex_color: "84C4E5", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '1.png'))

Buckle.create(name: "Blue", hex_color: "1D1F91", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '2.png'))

Buckle.create(name: "Brown", hex_color: "5E311D", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '3.png'))

Buckle.create(name: "Burnt Orange", hex_color: "CC5F24", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '4.png'))

Buckle.create(name: "Forest Green", hex_color: "113E00", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '5.png'))

Buckle.create(name: "Green", hex_color: "97D700", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '6.png'))

Buckle.create(name: "Grey", hex_color: "75777A", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '7.png'))

Buckle.create(name: "Hot Pink", hex_color: "E31C79", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '8.png'))

Buckle.create(name: "Khaki", hex_color: "EECC66", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '9.png'))

Buckle.create(name: "Lavender", hex_color: "D2A3CA", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '10.png'))

Buckle.create(name: "Lime", hex_color: "84BD00", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '11.png'))

Buckle.create(name: "Maroon", hex_color: "CB333B", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '12.png'))

Buckle.create(name: "Navy", hex_color: "13294B", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '13.png'))

Buckle.create(name: "Neon Yellow", hex_color: "F3F315", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '14.png'))

Buckle.create(name: "Olive", hex_color: "353b12", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '15.png'))

Buckle.create(name: "Orange", hex_color: "FF8F1A", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '16.png'))

Buckle.create(name: "Pink", hex_color: "FFA3B5", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '17.png'))

Buckle.create(name: "Plum", hex_color: "67476A", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '18.png'))

Buckle.create(name: "Red", hex_color: "ED1F1E", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '19.png'))

Buckle.create(name: "Sky Blue", hex_color: "05C3DE", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '20.png'))

Buckle.create(name: "Turquoise", hex_color: "2CD5C4", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '21.png'))

Buckle.create(name: "White", hex_color: "FFFFFF", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '22.png'))

Buckle.create(name: "Yellow", hex_color: "FEE528", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '23.png'))

Buckle.create(name: "Clear", hex_color: "EEF2F4", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '24.png'))

Buckle.create(name: "Silver", hex_color: "8A8D8F", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '25.png'))

Buckle.create(name: "Gold", hex_color: "7F6B00", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '26.png'))

Buckle.create(name: "Black Chrome", hex_color: "333333", style_id: 1, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'classic', '27.png'))


##################
## SKINNY BELTS ##
##################
puts 'ADDING SKINNY BELTS'

Belt.create(name: "Baby Blue", hex_color: "6EAED6", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '0.png'))

Belt.create(name: "Black", hex_color: "2D2926", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '1.png'))

Belt.create(name: "Hot Pink", hex_color: "E31C79", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '2.png'))

Belt.create(name: "Grey", hex_color: "A2A4A6", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '3.png'))

Belt.create(name: "Kelly", hex_color: "00C954", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '4.png'))

Belt.create(name: "Khaki", hex_color: "BBA47D", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '5.png'))

Belt.create(name: "Purple", hex_color: "7B2290", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '6.png'))

Belt.create(name: "Red", hex_color: "FF0000", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '7.png'))

Belt.create(name: "Sky", hex_color: "0086BF", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '8.png'))

Belt.create(name: "Tangerine", hex_color: "FFB51C", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '9.png'))

Belt.create(name: "White", hex_color: "FFFFFF", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '10.png'))

Belt.create(name: "Yellow", hex_color: "F6E730", style_id: 2, price_cents: 2000, price_currency: "USD",
  remote_image_url: image_url('belts', 'skinny', '11.png'))


####################
## SKINNY BUCKLES ##
####################
puts 'ADDING SKINNY BUCKLES'

Buckle.create(name: "Baby Blue", hex_color: "6EAED6", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '0.png'))

Buckle.create(name: "Black", hex_color: "2D2926", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '1.png'))

Buckle.create(name: "Hot Pink", hex_color: "E31C79", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '2.png'))

Buckle.create(name: "Grey", hex_color: "53565A", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '3.png'))

Buckle.create(name: "Kelly", hex_color: "00C954", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '4.png'))

Buckle.create(name: "Khaki", hex_color: "BBA47D", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '5.png'))

Buckle.create(name: "Purple", hex_color: "7B2290", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '6.png'))

Buckle.create(name: "Red", hex_color: "FF0000", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '7.png'))

Buckle.create(name: "Sky", hex_color: "009AFF", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '8.png'))

Buckle.create(name: "Tangerine", hex_color: "F0B323", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '9.png'))

Buckle.create(name: "White", hex_color: "FFFFFF", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '10.png'))

Buckle.create(name: "Yellow", hex_color: "F6E730", style_id: 2, price_cents: 500, price_currency: "USD",
  remote_image_url: image_url('buckles', 'skinny', '11.png'))

