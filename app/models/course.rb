class Course < ApplicationRecord
  belongs_to :modality
  has_many :media, dependent: :destroy

  validates :name, presence: true
  validates :modality, presence: true
end
