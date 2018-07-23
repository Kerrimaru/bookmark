class Tag < ApplicationRecord

  has_and_belongs_to_many :bookmarks

  validates :tag, presence: true, uniqueness: true

  #scope :check, lambda {|check| where(['tag_id == ?', "%#{check}%"])}

end
