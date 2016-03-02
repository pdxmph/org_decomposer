class Person < ActiveRecord::Base
  has_and_belongs_to_many :organizations
#  validates :email, :uniqueness => true
  has_many :goals

  def self.job(job)
    Person.includes(:organizations).where(organizations: { name: job}).order(:fullname)
  end

  
end
