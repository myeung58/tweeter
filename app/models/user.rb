class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
  has_many :followings
  validates_uniqueness_of :username, :email
  validates_presence_of :username, :password

end
