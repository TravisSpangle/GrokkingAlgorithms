require 'csv'

# Create an array that contains an empty array for unkown elements
lookup = Hash.new {|h,k| h[k] = [] }

# Load up the data as an array with a header
csv = CSV.new(File.read("../Homework/Ch5_data.csv"), :headers => true, :header_converters => :symbol, :converters => :all)

# Users is an array of User Hash structures
users = csv.to_a.map {|row| row.to_hash }

# Iterate through the users and assign them by their zip
#   in the lookup table
users.each do |user|
  lookup[user[:zip]] << user
end

puts lookup[10011].map{ |user| user[:first_name] }

# output
# Willow
# Jose
# Layla
