class UserFollowerRelationship < ApplicationRecord
  # The using posting stuff
  belongs_to :user
  # the user who wants to follow the same user id
  belongs_to :follower, class_name: 'User'
end
