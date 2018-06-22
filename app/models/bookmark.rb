class Bookmark < ApplicationRecord

  self.per_page = 30

  belongs_to :user
  has_one_attached :screenshot

  validates :url, presence: true
  #validates :screenshot, presence: true

  # def self.search(search)
  #   if search
  #     where(['title LIKE ?', "%#{:search}%"])
  #   else
      
  #   end
  # end

end
