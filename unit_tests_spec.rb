
require_relative './utils/spec_helper'

describe "Test Login Page" do
  def app
    Sinatra::Application
  end

  it "login page loads" do
    get '/login/?'
    expect(last_response).to be_ok
  end

  it "successful login with valid credentials" do
    post '/login/?', params = { :username => "mhawk2", :password => "Welcome123" }
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to The Engineering Garage')
  end

  it "unsuccessful login with invalid credentials" do
    post '/login/?', params = { :username => "development23", :password => "Welcome123" }
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to include('Username/password combination is incorrect.')
  end
end

describe "Test Checkout Page" do
	def app
		Sinatra::Application
	end

	before do
		@user = User.find_by(user_nuid: "11111111")
		env "rack.session", { :user_id => @user.id }
	end

	it "checkout page loads" do
		get '/checkout/?'
		expect(last_response).to be_ok
	end

	it "load user via valid nuid" do
		get '/checkout/user/?', params = { :nuid => "12345678" }
		expect(last_response).to be_ok
		expect(last_response.body).to include('mhawk2')
	end

	it "reject invalid nuid" do
		get '/checkout/user/?', params = { :nuid => "99999999" }
		follow_redirect!
		expect(last_response).to be_ok
		expect(last_response.body).to include('User with that NUID not found')
	end
end

# describe "Test New Member Sign-Up" do
#   def app
#     Sinatra::Application
#   end

#   it "new member page loads" do
#     get '/new_members/'
#     expect(last_response).to be_ok
#   end
# end
