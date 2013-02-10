class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  					:first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  has_many :statuses
  #rails itself understands that when use statuses,
  #there must be model called status, which has
  #user_id which would link to this model.
  #This is called convention over configuration.

  def full_name
    first_name + " " + last_name
  end #defining our own custom variables which has the 
  #combination of first and last name.
end
