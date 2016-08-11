require 'csv'

lookup = Hash.new {|h,k| h[k] = [] }
csv = CSV.new(File.read("../Homework/Ch5_data.csv"), :headers => true, :header_converters => :symbol, :converters => :all)
users = csv.to_a.map {|row| row.to_hash }

users.each do |user|
  lookup[user[:zip]] << user
end

puts lookup[10011].map{ |user| user[:first_name] }

# output
# Willow
# Jose
# Layla
