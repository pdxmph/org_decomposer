puppet = Organization.find_or_create_by(:name => "Puppet Labs")
puppet.save

eng = Organization.find_or_create_by(:name => "Product and Technology", :parent_id => puppet.id)
eng.save

product = Organization.find_or_create_by(:name => "Product", :parent_id => puppet.id)
product.save

prod_mgt = Organization.find_or_create_by(:name => "Product Management", :parent_id => product.id)
prod_mgt.save

engineering = Organization.find_or_create_by(:name => "Engineering", :parent_id => eng.id)
engineering.save

scrum_teams = [
  "App Orchestration",
  "Client",
  "Configuration Mgmt",
  "Code Mgmt",
  "Integration",
  "Forge",
  "Language",
  "Modules",
  "Node Mgmt",
  "PCP",
  "PE Core",
  "PuppetDB",
  "PuppetServer",
  "Windows"
]

eng_services_teams = [
  "UX",
  "Technical Publications",
  "QA",
  "QE",
  "RE",
  "Project Management"
]

scrum_teams.each do |s|
  t = Organization.new
  t.name = s
  t.kind = "Scrum Team"
  t.parent_id = eng.id
  t.save
end

eng_services_teams.each do |s|
  t = Organization.new
  t.name = s
  t.kind = "Services Team"
  t.parent_id = eng.id
  t.save
end

