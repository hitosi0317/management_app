class Motion < ApplicationRecord
  belongs_to :user

  validates :plans1,:count1, presence: true
  validates :weight, numericality: true

  validates :count2, :count3, :count4, :count5, presence: true, unless: :count?

  def count?
    plans2.blank?
    plans3.blank?
    plans4.blank?
    plans5.blank?
  end
end
