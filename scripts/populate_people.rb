require 'csv'

csv = File.join(File.dirname(__FILE__), "org_chart.csv")
csv_text = File.read(csv)
csv = CSV.parse(csv_text)
puts csv.count
csv.each do |row|
  org1 = Organization.find_by_name(row[1].strip)
  org2 = Organization.find_by_name(row[0].strip)
  person = Person.new
  person.title = row[3]
  person.fullname = row[2]
  person.save
  org1.people << person
  org1.save
  org2.people << person
  org2.save
end
