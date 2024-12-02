require "models/project"
require "date"
require "erb"

get "/checkout/?" do
  @breadcrumbs << { :text => "Checkout" }
  require_login
  erb :'engineering_garage/checkout', :layout => :fixed, locals: {}
end

get "/checkout/user/?" do
  @breadcrumbs << { :text => "Checkout" }
  require_login
  nuid = params[:nuid]

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
      user_projects = Project.where(owner_user_id: checkout_user.id)
			# Preload the tool list
    end
  end

  # user_projects = [
  #   { id: 1, location: "Garage A", name: "Project Alpha", last_accessed: (DateTime.now - 1).strftime("%m/%d/%Y %H:%M"), description: "Building a robot" },
  #   { id: 2, location: "Garage B", name: "Project Beta", last_accessed: (DateTime.now - 2).strftime("%m/%d/%Y %H:%M"), description: "Creating a drone" },
  #   { id: 3, location: "Garage C", name: "Project Gamma", last_accessed: (DateTime.now - 3).strftime("%m/%d/%Y %H:%M"), description: "Developing a new app" },
  #   { id: 4, location: "Garage D", name: "Project Delta", last_accessed: (DateTime.now - 4).strftime("%m/%d/%Y %H:%M"), description: "Designing a new car model" },
  #   { id: 5, location: "Garage E", name: "Project Epsilon", last_accessed: (DateTime.now - 5).strftime("%m/%d/%Y %H:%M"), description: "Constructing a bridge" },
  # ]
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
                                             :projects => user_projects,
                                           }
end

=begin
get "/checkout/project/:nuid/user" do
  @breadcrumbs << { :text => "New_Project" }
  require_login

  erb :'engineering_garage/new_project_user_confirmation', :layout => :fixed, :locals => {}
end

post "/checkout/project/:nuid/user" do
  @breadcrumbs << { :text => "New_Project" }
  require_login
  user_by_nuid = User.find_by(user_nuid: params[:nuid])
  user_by_email = User.find_by(email: params[:email])
  user = nil

  if user_by_nuid != nil && user_by_email != nil
    if user_by_nuid != user_by_email
      flash :error, "Error", "User by NUID and User by email do not match"
      redirect back
    end
  elsif user_by_nuid == nil && user_by_email == nil
    flash :error, "Error", "User not found"
    redirect back
  elsif user_by_nuid != nil
    user = user_by_nuid
  else
    user = user_by_email
  end
  session[:user_id] = user.id if user
  redirect "/checkout/project/create?"
end
=end

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

  project = Project.new
  params[:user] = User.find_by(user_nuid: params[:nuid])
  project.set_data(params)
  project.update_last_checked_in
  redirect "/checkout"
end

get "/checkout/project/:project_id/edit" do
  @breadcrumbs << { :text => "New_Project" }
  require_login
  project = Project.find_by(id: params[:project_id])
  user = User.find_by(id: project.owner_user_id)
  erb :'engineering_garage/edit_project', :layout => :fixed, :locals => {
                                           :user => user,
                                           :title => project.title,
                                           :description => project.description,
                                           :bin_id => project.bin_id,
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

  project.set_data(params)
  redirect "/checkout"
end