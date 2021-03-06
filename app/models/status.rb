class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user #making associations between users
  #and their statues and their ids
  #we write belong to user and ruby understands
  #that there is something called user_id
  #convention over configuration

  validates :content, presence: :true,
  						length: {minimum: 2}

  validates :user_id, presence: :true
end

#lists the fields that can be modified in database by
#using a form
