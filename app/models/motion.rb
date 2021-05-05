class Motion < ApplicationRecord
  belongs_to :user
  validates :training1, :count1, presence: true

end
