Organization.all.each do |org|
    if org.kind == "Services Team" or org.name == "Product Management"
      Organization.scrum_teams.each do |scrum_team|
        goal = Goal.find_or_create_by(organization_id: org.id, support_id: scrum_team.id, name: scrum_team.name, kind: "Scrum Team Support")
        goal.priority = 0
        goal.support = 0
        goal.save
      end
    end
end
