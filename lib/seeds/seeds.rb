require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  t = Transaction.new
  t.street = row['street']
  t.city = row['city']
  t.zip = row['zip']
  t.zip = row['zip']
  t.state = row['state']
  t.beds = row['beds']
  t.sq_feet = row['sq_feet']
  t.category = row['type']
  t.sale_date = row['sale_date']
  t.price = row['price']
  t.lat = row['latitude']
  t.lng = row['longitude']
  t.save
  puts "#{t.street}, #{t.city} saved"
end