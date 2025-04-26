class Modality < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :courses, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_param
    slug
  end
end
