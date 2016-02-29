class OrganizationsController < ApplicationController



  def show
    @organization = Organization.find(params[:id])
    @organizations = @organization.children
    @title = @organization.name
    @people = @organization.people
  end


  def index
    @organizations = Organization.top_level
    @title = "Organizations" 
  end

  def edit
    @organization = Organization.find(params[:id])
    @developers = Person.job("Engineering")
    @ux = Person.job("UX")
    @prod = Person.job("Product")
    @qa = Person.job("QA")
    @qe = Person.job("QE")
    @pm = Person.job("Project Management")
    @docs = Person.job("Technical Publications")
  end


  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      redirect_to organization_path(@organization.parent)
    else
      render 'edit', alert: "Bad value in your edit form. Better talk to Mike."
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :kind, :parent_id, :person_ids => [])
  end
end