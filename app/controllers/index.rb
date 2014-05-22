get '/' do

  erb :index
end

post '/login' do
	if User.authenticate(params[:username], params[:password])
    @user = User.find_by_username(params[:username])
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @error = "Your username or password was incorrect."
    erb :index
  end
end

post '/signup' do
	@user = User.create(params[:user])
  redirect to "/" 
end

