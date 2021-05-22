class Historie < ApplicationRecord
  belongs_to :user
  belongs_to :motion
end
