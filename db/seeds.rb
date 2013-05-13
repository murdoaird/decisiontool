puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.create!({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
user2 = User.create! :name => 'User02', :email => 'blah@blah.com', :password => '1234567890', :password_confirmation => '1234567890'
puts 'user: ' << user2.name
user2.add_role :VIP