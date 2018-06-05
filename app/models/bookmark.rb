class Bookmark < ApplicationRecord

  belongs_to :user

  validates :url, presence: true
  validates :screenshot, presence: true

end
