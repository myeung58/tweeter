helpers do
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

  def logged_in?
    !current_user.nil?
  end

  def page_owner?
    @current_user.id == params[:id].to_i
  end

	def avatar_url(email)
		gravatar_id = Digest::MD5.hexdigest(email)
		"http://gravatar.com/avatar/#{gravatar_id}"
	end

  def not_currently_followed_by_me(user_id)
    Following.where(following_id: user_id, follower_id: current_user.id).count == 0
  end

  def user_has_no_relationship(user_id)
    Following.where(following_id: user_id).count == 0
  end


end
