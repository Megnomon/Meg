class Pbass < ApplicationRecord
  belongs_to :user
  has_many :pbrequests
end
