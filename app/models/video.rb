class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order "created_at DESC" }
  has_many :queue_items

  mount_uploader :large_cover, LargeCoverUploader
  mount_uploader :small_cover, SmallCoverUploader

  validates_presence_of :title, :description

  def self.search_by_title(title)
    return [] if title.blank?
    
    where('lower(title) LIKE :search_term', search_term: '%' + title.to_s.downcase + '%').order(created_at: :desc)
  end

  def rating
    reviews.average(:rating).round(1) if reviews.average(:rating)
  end
end