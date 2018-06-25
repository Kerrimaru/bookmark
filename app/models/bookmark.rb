class Bookmark < ApplicationRecord

  self.per_page = 30

  belongs_to :user
  has_one_attached :screenshot
  has_and_belongs_to_many :tags

  validates :url, presence: true

  #default_scope lambda { order(created_at: :desc) }

  scope :oldest, lambda { order(created_at: :asc)}

  scope :recent, lambda {
    where(:created_at => 1.week.ago..Time.now)
  }

  scope :search, lambda {|search| where(['title LIKE ?', "%#{search}%"])}

end
