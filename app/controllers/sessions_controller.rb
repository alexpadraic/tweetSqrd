get '/sessions/new' do
  p session
  erb :'/sessions/new'
end

post '/sessions' do
  p params

  @user = User.find_by(email: params["email"])
  @tweets =

  if @user && @user.password == params["password"]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Couldn't log in"
    erb :'/sessions/new'
  end

end


get '/sessions/delete' do
  session[:user_id] = nil
  redirect '/'
end

