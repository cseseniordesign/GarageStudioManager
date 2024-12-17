require 'active_record'

class ToolLog < ActiveRecord::Base
	def set_data(params)
		self.checkout_user_id = params[:user].id
		self.tool_id = params[:tool].id
		self.tool_name = params[:tool].title
		self.checked_date = Time.now
		self.is_checking_in = params[:is_checking_in]
		self.save
	end
end