require 'active_record'

class ProjectTeammate < ActiveRecord::Base
  belongs_to :project
  
  def set_data(params)
    self.teammate_id = params[:teammate_id]
    self.project_id = params[:project_id]
    self.created_by = params[:user].id
    self.created_on = Time.now  
    self.save
  end

end