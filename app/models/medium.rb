class Medium < ApplicationRecord
  belongs_to :course

  validates :title, presence: true
  validates :url, presence: true
  validates :media_type, presence: true, inclusion: { in: %w[video artigo pdf] }

  before_validation :set_media_type_based_on_url

  private

  def set_media_type_based_on_url
    unless self.media_type.present?
      if url.present? 
        if url.include?('youtube.com') || url.include?('youtu.be')
          self.media_type = 'video'
        elsif url.end_with?('.pdf')
          self.media_type = 'pdf'
        else
          self.media_type = 'artigo'
        end
      end
    end
  end
end