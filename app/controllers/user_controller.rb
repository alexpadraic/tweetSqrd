get '/users' do
  @users = User.all #define instance variable for view

  erb :'users/index' #show all users view (index)
end

get '/users/new' do

  erb :'users/new' #show new users view

end


post '/users/new' do

  if params[:password1] == params[:password2]
    @user = User.new(name: params[:username], email: params[:email], password: params[:password1])
      if @user.save
        redirect '/'
      else
        erb :'users/new'
      end
  end

end

get '/users/:id' do
  p params
  #gets params from url

  @user = User.find(params[:id]) #define instance variable for view
  @tweets = Tweet.find_by(user_id: params[:id])
  p @tweets

  if Friend.find_by(follower_id: session[:user_id], followee_id: params[:id])
    @following = true
    p "Hello"
  end

  p @following

  erb :'users/show' #show single user view

end

# get '/users/:id/edit' do

#   #get params from url
#   @user = User.find(params[:id]) #define intstance variable for view

#   erb :'users/edit' #show edit user view

# end

# put '/users/:id' do

#   #get params from url
#   @user = User.find(params[:id]) #define variable to edit

#   @user.assign_attributes(params[:user]) #assign new attributes

#   if @user.save #saves new user or returns false if unsuccessful
#     redirect '/users' #redirect back to users index page
#   else
#     erb :'users/edit' #show edit user view again(potentially displaying errors)
#   end

# end

# delete '/users/:id' do

#   #get params from url
#   @user = User.find(params[:id]) #define user to delete

#   @user.destroy #delete user

#   redirect '/users' #redirect back to users index page

# end
