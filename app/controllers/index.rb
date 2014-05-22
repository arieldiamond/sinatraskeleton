get '/' do

  erb :index
end

post '/login' do
	email = params[:email]
	password = params[:password]
	if User.authenticate(email, password)
		user = User.find_by_email(email)
		session[:user_id] = user.id
		redirect to '/user/index'
	else
		redirect to '/?params_login=Please try again.'
	end

end

post '/signup' do
	@user = User.create(params[:user])

  redirect to "/" 
end

get 'logout' do 
	session.clear

	redirect to '/'
end

