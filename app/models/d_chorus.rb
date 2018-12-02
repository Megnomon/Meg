class DChorus < ApplicationRecord
  belongs_to :user
  has_many :dcrequests, dependent: :destroy
end
