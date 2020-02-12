class UserCamera < ApplicationRecord
  belongs_to :user
  belongs_to :camera
end
