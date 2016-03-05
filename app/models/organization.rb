class Organization < ActiveRecord::Base

  after_create :create_support_goals
  
  has_and_belongs_to_many :people
  has_many :children, class_name: "Organization", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Organization"
  validates :name, :uniqueness => true
  has_many :goals
  markdownize! :note
  
  def self.top_level
    puppet = Organization.find_by_name("Puppet Labs")
    where(parent_id: puppet.id)
  end

  def self.scrum_teams
    where(kind: "Scrum Team").order(:name)
  end

  def self.services_teams
    where(kind: "Services Team").order(:name)
  end

  def services_goals
    services_goals = Goal.where("kind = ? and support_id = ?", "Scrum Team Support", self.id)
    return services_goals
  end
  
  def self.services_teams_and_prod
    where(kind: "Services Team").order(:name)
  end

  
  def has_children
    self.children.count > 0 ? true : false
  end

  def has_people
    self.people.count > 0 ? true : false
  end

  def people_in_job(job)
    self.people.includes(:organizations).where(organizations: {name: job}).order(:fullname)
  end


  def scrum_support(scrum_team)
    support_goal = self.goals.where("support_id = ? and kind = ?", scrum_team.id, "Scrum Team Support").first
  end
  
  def create_support_goals

    if self.kind == "Services Team"
      Organization.scrum_teams.each do |scrum_team|
        goal = Goal.find_or_create_by(organization_id: id, support_id: scrum_team.id, name: scrum_team.name, kind: "Scrum Team Support")
        goal.save
      end
    end
  end
  
  
end
