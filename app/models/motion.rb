class Motion < ApplicationRecord
  belongs_to :user
  validates :training1, :count1, :weight, presence: true
  validates  :weight numericality: true

end
