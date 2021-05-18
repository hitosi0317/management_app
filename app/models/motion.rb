class Motion < ApplicationRecord
  belongs_to :user

  validates :training1, presence: true
  validates :count1, :weight, numericality: true
  
  validates :count2, :count3,:count4,:count5,numericality: true, unless: :count?

  def count?
    count2.blank?
    count3.blank?
    count4.blank?
    count5.blank?
  end

end
