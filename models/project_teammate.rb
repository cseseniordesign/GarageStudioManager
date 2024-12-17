require 'active_record'

class ProjectTeammate < ActiveRecord::Base
  belongs_to :project
  
  def set_data(params)
    self.teammate_id = params[:teammate_id]
    self.project_id = params[:project_id]
    self.created_by = params[:user].id
    self.created_on = Time.now
    self.is_owner = params[:is_owner]
    self.save
  end

  def find_username()
    return User.find_by(id: self.teammate_id)
  end

  def set_owner()
    current_owner = ProjectTeammate.find_by(project_id: self.project_id, is_owner: 1)
    if current_owner != nil
      current_owner.is_owner = 0
      current_owner.save
    end
    self.is_owner = 1
    self.save
  end
end