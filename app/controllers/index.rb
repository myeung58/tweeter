get '/' do
  if logged_in?
    @user = current_user
    @tweets = @user.tweets
    redirect "/users/#{@user.id}/homepage"
  else
    erb :index
  end
end
