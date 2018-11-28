class Ddrum < ApplicationRecord
  belongs_to :user
  has_many :ddrequests
end
