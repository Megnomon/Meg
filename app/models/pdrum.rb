class Pdrum < ApplicationRecord
  belongs_to :user
  has_many :pdrequests
end
