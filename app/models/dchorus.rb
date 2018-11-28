class Dchorus < ApplicationRecord
  belongs_to :user
  has_many :dcrequests
end
