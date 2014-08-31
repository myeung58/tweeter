get '/users/:id/tweets/new' do
  if logged_in? && page_owner?
    @user = User.find(params[:id])
    erb :"/tweets/new"
  elsif logged_in?
    @user = User.find(params[:id])
    redirect "/"
  else
    redirect "/signin"
  end
end

post '/users/:id/tweets/new' do

    @user = User.find(params[:id])
    @user.tweets << Tweet.create(content: params[:content])
    redirect "/users/#{@user.id}/homepage"

end

# to check specific tweets
get '/users/:id/tweets/:tweet_id' do
  @user = User.find(params[:id])
  @tweet = Tweet.find(params[:tweet_id])
  erb :"tweets/show"
end

get '/users/:id/tweets/:tweet_id/delete' do
  if logged_in? && page_owner?
    @user = User.find(params[:id])
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.destroy
    redirect "/users/#{@user.id}/homepage"
  else
    redirect "/signin"
  end
end
