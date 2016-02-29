module OrganizationsHelper

  def list_people(organization)

    team_roles = ["Engineering", "UX", "QA", "Technical Publications"]
    puts organization.inspect
    team_roles.each do |job|
      render 'people_list', :job => job, :organization => organization
    end
        
  end

end
