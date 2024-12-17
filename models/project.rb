require 'active_record'

class Project < ActiveRecord::Base
	def edit_link
		"/checkout/#{id}/edit/"
	end

	def set_data(params)
		self.owner_user_id = params[:user].id
		self.title = params[:title]
		self.description = params[:description]
		self.bin_id = params[:bin_id]
		self.save
	end

	def update_last_checked_in()
		self.last_checked_in = Time.now
		self.save
	end

	def update_last_checked_out()
		self.last_checked_out = Time.now
		self.save
	end

	def delete()
		self.destroy
		self.save
	end

	def find_teammates()
		project_teammates = ProjectTeammate.where(project_id: self.id)
		return project_teammates
	end
end