get '/users/:id/homepage' do
  @user = User.find(params[:id])
  @user_tweets = @user.tweets
  if current_user
    @not_following = []
    User.all.each do |that_user|
      if not_currently_followed_by_me(that_user.id) || user_has_no_relationship(that_user.id)
        @not_following << that_user
      end
    end
  end
  erb :"users/homepage"
end

get '/signin' do
  erb :"users/signin"
end

post '/signin' do
  @user = User.where(username: params[:username], password: params[:password]).first
  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    "We don't recognize this username or password.  Please try again!"
  end
end

get '/signup' do
  erb :"users/signup"
end

post '/signup' do
  User.create(params)
  @user = User.last
  Following.create(following_id: @user.id, follower_id: @user.id)
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  if logged_in? && page_owner?
    erb :"/users/edit_user"
  else
    redirect '/'
  end
end

post '/users/:id/edit' do
  if logged_in? && page_owner?
    @user = User.find(params[:id])
    @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      about: params[:about],
      location: params[:location],
      password: params[:password],
      username: params[:username])
    redirect "/"
  else
    redirect '/'
  end

end

get '/users/:id/delete' do
  if logged_in? && page_owner?
    @user = User.find(params[:id])
    session[:user_id] = nil
    @user.delete
    redirect '/'
  else
    redirect '/'
  end
end

get '/users/:id/followers' do
  @user = User.find(params[:id])
    @being_followed = Following.where(following_id: params[:id])
    @followers = []
    @being_followed.each do |following_relationship|
      @followers << User.find(following_relationship.follower_id)
    end
    erb :"users/show_followers"
end

get '/users/:id/following' do
  @user = User.find(params[:id])
    @followed = Following.where(follower_id: params[:id])
    @followings = []
    @followed.each do |following_relationship|
      @followings << User.find(following_relationship.following_id)
    end
    erb :"users/show_followings"
end


#### Alisa's Little Part ####

get '/users/:id/all_followers_tweets' do 
  @user = User.find(params[:id])

  erb :"users/all_followers_tweets"

end

get '/users/:id/follow/:following_id' do
  Following.create(following_id: params[:following_id], follower_id: current_user.id)
  redirect "/users/#{current_user.id}/homepage"
end







