class Bookmark < ApplicationRecord

  self.per_page = 30

  belongs_to :user
  has_one_attached :screenshot
  has_and_belongs_to_many :tags
  #accepts_nested_attributes_for :tags, :allow_destroy => true

  validates :url, presence: true

  def thumbnail(image)
    return self.screenshot.variant(resize: '225').processed
  end

  scope :oldest, lambda { order(created_at: :asc)}

  scope :newest, lambda { order(created_at: :desc)}

  scope :title, lambda { order(title: :asc)}

  scope :recent, lambda {
    where(:created_at => 1.week.ago..Time.now)
  }

  scope :unrecent, lambda {
    where(:created_at => 2.week.ago)
  }

  scope :search, lambda {|search| where(["LOWER(title) LIKE ?", "%#{search.downcase}%"])}

end
