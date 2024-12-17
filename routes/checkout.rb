require "models/project"
require "models/project_teammate"
require "models/project_log"
require "date"
require "erb"

before "/checkout*" do
	unless @user.id == -1
		raise Sinatra::NotFound
	end
end

get "/checkout/?" do
  @breadcrumbs << { :text => "Checkout" }
  require_login
  erb :'engineering_garage/checkout', :layout => :fixed, locals: {}
end

get "/checkout/user/?" do
  @breadcrumbs << { :text => "Checkout" }
  require_login
  nuid = params[:nuid]
	search_id = params[:search_id]

  if nuid.nil? || nuid.strip.empty?
    redirect "/checkout/"
  else
    
    #If the nuid length is 8, it was manually input and should be correct
    #If not, it'll be nuid+issue code from a barcode scan
    if nuid.length != 8 
      #pre-pends with zeroes if the input is not 13 characters long 
      nuid = nuid.rjust(13, "0")
      #extracts the NUID portion from the scanned input
      nuid = nuid[0, 8]
    end

    checkout_user = User.find_by(user_nuid: nuid)
    if checkout_user.nil?
      flash :danger, "Error", "User with that NUID not found"
      redirect "/checkout/"
    else
			# Preload the project list
      projects = Project.where(owner_user_id: checkout_user.id)

      team_project_ids = ProjectTeammate.where(teammate_id: checkout_user.id).pluck(:project_id)
      team_projects = Project.where(id: team_project_ids)

      projects = projects.or(team_projects)

      if search_id && !search_id.strip.empty?
        projects = projects.where(bin_id: search_id.strip)
      end
    end
  end
  
  # Placeholder data
  # This data does not interact with anything shown to the user currently
  user_checked_out = [
    { id: 1, name: "Hammer", checked_out_date: (DateTime.now - 1).strftime("%m/%d/%Y %H:%M") },
    { id: 2, name: "Screwdriver", checked_out_date: (DateTime.now - 2).strftime("%m/%d/%Y %H:%M") },
    { id: 3, name: "Wrench", checked_out_date: (DateTime.now - 3).strftime("%m/%d/%Y %H:%M") },
    { id: 4, name: "Pliers", checked_out_date: (DateTime.now - 4).strftime("%m/%d/%Y %H:%M") },
    { id: 5, name: "Saw", checked_out_date: (DateTime.now - 5).strftime("%m/%d/%Y %H:%M") },
  ]

  erb :"engineering_garage/checkout_user", :layout => :fixed, locals: {
                                             :user => checkout_user,
																						 :nuid => nuid,
                                             :checked_out => user_checked_out,
                                             :projects => projects
                                           }
end

post "/checkout/project_checkout/?" do
	bin_id = params[:bin_id]
	nuid = params[:nuid]

	if bin_id != nil && nuid != nil
		project = Project.find_by(bin_id: bin_id)
		user = User.find_by(user_nuid: nuid)
		if project != nil && user != nil
			project.update_last_checked_out
			project_log = ProjectLog.new
			project_log.set_data(user: user, project: project, is_checking_in: false)
			flash :success, 'Success', 'Project checked out'
			redirect "/checkout/?"
		else
			flash :error, 'Error', 'Project not found'
			redirect "/checkout/"
		end
	else
		flash :error, 'Error', 'Bin ID not found'
		redirect "/checkout/"
	end
end

post "/checkout/project_checkin/?" do
	bin_id = params[:bin_id]
	nuid = params[:nuid]

	if bin_id != nil && nuid != nil
		project = Project.find_by(bin_id: bin_id)
		user = User.find_by(user_nuid: nuid)
		if project != nil
			project.update_last_checked_in
			project_log = ProjectLog.new
			project_log.set_data(user: user, project: project, is_checking_in: true)
			flash :success, 'Success', 'Project checked in'
			redirect "/checkout/?"
		else
			flash :error, 'Error', 'Project not found'
			redirect "/checkout/"
		end
	else
		flash :error, 'Error', 'Bin ID not found'
		redirect "/checkout/"
	end
end

post "/checkout/project_delete/?" do
	bin_id = params[:bin_id]

	if bin_id != nil
		project = Project.find_by(bin_id: bin_id)
		if project != nil
			project.delete
			flash :success, 'Success', 'Project deleted'
			redirect "/checkout/?"
		else
			flash :error, 'Error', 'Project not found'
			redirect "/checkout/"
		end
	else
		flash :error, 'Error', 'Bin ID not found'
		redirect "/checkout/"
	end
end

get "/checkout/project/:nuid/create" do
  @breadcrumbs << { :text => "New_Project" }
  require_login
  user = User.find_by(user_nuid: params[:nuid])
  erb :'engineering_garage/new_project', :layout => :fixed, :locals => {
                                           :user => user,
                                         }
end

post "/checkout/project/:nuid/create" do
  @breadcrumbs << { :text => "New_Project" }
  require_login

  if  params[:title].blank?
		flash :error, 'Error', 'Please enter a title'
		redirect back
	end 

  if  params[:bin_id].blank?
		flash :error, 'Error', 'Please enter a bin code'
		redirect back
	end 

  if Project.find_by(bin_id: params[:bin_id]) != nil
    flash :error, 'Error', "A project with that Bin ID already exists. If you believe this to be an error, please contact an administrator."
		redirect back
  end

  params[:user] = User.find_by(user_nuid: params[:nuid])
  project = Project.new
  project.set_data(params)
  project.update_last_checked_in

  teammates = ProjectTeammate.new
  params[:project_id] = project.id
  params[:teammate_id] = User.find_by(user_nuid: params[:nuid]).id
  params[:user] = @user
  params[:is_owner] = 1
  teammates.set_data(params)

  flash :success, 'Success', 'Project created'
  redirect "/checkout"
end

get "/checkout/project/:project_id/edit" do
  @breadcrumbs << { :text => "New_Project" }
  require_login
  project = Project.find_by(id: params[:project_id])
  user = User.find_by(id: project.owner_user_id)
  teammates = ProjectTeammate.where("project_id = ?", params[:project_id])
  params[:previous_nuid] = user.user_nuid

  erb :'engineering_garage/edit_project', :layout => :fixed, :locals => {
                                           :user => user,
                                           :title => project.title,
                                           :description => project.description,
                                           :bin_id => project.bin_id,
                                           :teammates => teammates,
                                           :project_id => project.id,
                                         }
end

post "/checkout/project/:project_id/edit" do
  @breadcrumbs << { :text => "New_Project" }
  require_login
  project = Project.find_by(id: params[:project_id])
  params[:user] = User.find_by(user_nuid: params[:nuid])

  if  params[:title].blank?
		flash :error, 'Error', 'Please enter a title'
		redirect back
	end 

  if  params[:bin_id].blank?
		flash :error, 'Error', 'Please enter a bin code'
		redirect back
	end

  if  params[:user].nil?
		flash :error, 'Error', 'User with provided NUID not found'
		redirect back
	end 

  project_by_bin = Project.find_by(bin_id: params[:bin_id])
  if project_by_bin != nil
    if project_by_bin.id != project.id
      flash :error, 'Error', "A project with that Bin ID already exists. If you believe this to be an error, please contact an administrator."
      redirect back
    end
  end

  if project.owner_user_id != params[:user].id
    user_team_profile = ProjectTeammate.find_by(project_id: project.id, teammate_id: params[:user].id)
    if user_team_profile == nil
      user_team_profile = ProjectTeammate.new
      params[:teammate_id] = params[:user].id
      params[:is_owner] = 0
      user_team_profile.set_data(params)
    end
    user_team_profile.set_owner
  end

  project.set_data(params)

  flash :success, 'Success', 'Project updated'
  redirect "/checkout"
end

get "/checkout/project/:project_id/edit/teammates" do
  @breadcrumbs << { :text => "Teammates" }
  require_login

  project = Project.find_by(id: params[:project_id])
  teammates = ProjectTeammate.where("project_id = ?", params[:project_id])

  erb :'engineering_garage/edit_teammates', :layout => :fixed, :locals => {
                                            :project_id => project.id,
                                            :teammates => teammates
                                          }
end

post "/checkout/project/:project_id/edit/teammates/" do
  @breadcrumbs << { :text => "Teammates" }
  require_login

  nuid = params[:nuid]
  if nuid.nil? || nuid.strip.empty?
    flash :danger, "Error", "NUID empty."
    redirect back
  end

  teammate_user = User.find_by(user_nuid: nuid)
  if teammate_user.nil?
    flash :danger, "Error", "User with that NUID not found."
    redirect back
  end

  # Check if user is already a teammate
  existing_teammate = ProjectTeammate.find_by(teammate_id: teammate_user.id, project_id: params[:project_id])
  unless existing_teammate.nil?
    flash :danger, "Error", "User already listed as a teammate."
    redirect back
  end

  teammate = ProjectTeammate.new
  params[:teammate_id] = teammate_user.id
  params[:user] = @user
  params[:is_owner] = 0
  teammate.set_data(params)

  flash :success, "Teammate Added", "#{teammate_user.full_name} was added as a teammate."
  redirect "/checkout/project/#{params[:project_id]}/edit/teammates"
end

post "/checkout/project/:project_id/edit/teammates/:teammate_id/remove" do
  @breadcrumbs << { :text => "Teammates" }
  require_login

  teammate_user = ProjectTeammate.find_by(id: params[:teammate_id])
  if teammate_user.nil?
    flash :danger, "Error", "Could not locate user."
    redirect back
  end

  # Prevent project owner deletion
  if teammate_user.is_owner
    flash :danger, "Error", "Cannot remove project owner."
    redirect back
  end

  teammate_user.delete
  flash :success, "Teammate Removed", "User was removed as a teammate."
  redirect "/checkout/project/#{params[:project_id]}/edit/teammates"
end