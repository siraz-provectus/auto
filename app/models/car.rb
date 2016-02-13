class Car < ActiveRecord::Base
	has_many :photos, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :registration_number, presence: true, length: { maximum: 14 }
  validates :pts, presence: true, length: { maximum: 30 }
  validates :pts_date, presence: true


  accepts_nested_attributes_for :photos
end
