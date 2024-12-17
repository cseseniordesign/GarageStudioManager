require 'active_record'

class ProjectLog < ActiveRecord::Base
	def set_data(params)
		self.checkout_user_id = params[:user].id
		self.project_id = params[:project].id
		self.project_title = params[:project].title
		self.checked_date = Time.now
		self.is_checking_in = params[:is_checking_in]
		self.save
	end
end