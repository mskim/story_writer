# Create default account and user for testing
account = Account.find_or_create_by!(name: "MyLife") do |a|
  a.account_type = "individual"
end

user = User.find_or_initialize_by(email_address: "mskimsid@gmail.com") do |u|
  u.account = account
  u.name = "MyLife User"
  u.password = "it-is-mylife"
  u.password_confirmation = "it-is-mylife"
end

if user.new_record?
  user.save!
  puts "✅ Created default user: mskimsid@gmail.com"
else
  puts "ℹ️  User already exists: mskimsid@gmail.com"
end

puts "\n📧 Email: mskimsid@gmail.com"
puts "🔑 Password: it-is-mylife"
puts "🏢 Account: #{account.name}"
