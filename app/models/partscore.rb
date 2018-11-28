class Partscore < ApplicationRecord
  belongs_to :user
  has_many :pgrequests
end
