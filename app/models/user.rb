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


  validates :first_name, presence: true

  validates :last_name, presence: true
  validates :profile_name, presence: true,
                            uniqueness: true,
                            format: {
                              with: /a-zA-Z0-9_-/, #regular expression, to match strings of text
                              message: 'Must be formatted correctly.'
                            }

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
