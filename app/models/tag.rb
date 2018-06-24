class Tag < ApplicationRecord

  has_and_belongs_to_many :bookmarks

  #scope :check, lambda {|check| where(['tag_id == ?', "%#{check}%"])}


end
