class Follow < ActiveRecord::Base
  attr_accessible :following, :user_id
  belongs_to :user
end
