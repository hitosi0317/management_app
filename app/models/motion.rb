class Motion < ApplicationRecord
  belongs_to :user

<<<<<<< Updated upstream
  validates :plans1,:count1, presence: true
=======
  validates :plans1, :count1, presence: true
>>>>>>> Stashed changes
  validates :weight, numericality: true

  validates :plans2, presence: true, unless: :count2?
  validates :count2, presence: true, unless: :plans2?
  validates :plans3, presence: true, unless: :count3?
  validates :count3, presence: true, unless: :plans3?
  validates :plans4, presence: true, unless: :count4?
  validates :count4, presence: true, unless: :plans4?
  validates :plans5, presence: true, unless: :count5?
  validates :count5, presence: true, unless: :plans5?

  def count2?
    count2.blank?
  end

  def plans2?
    plans2.blank?
  end

  def count3?
    count3.blank?
  end

  def plans3?
    plans3.blank?
  end

  def count4?
    count4.blank?
  end

  def plans4?
    plans4.blank?
  end

  def count5?
    count5.blank?
  end

  def plans5?
    plans5.blank?
  end
end
