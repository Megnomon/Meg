class Dbass < ApplicationRecord
  belongs_to :user
  has_many :dbrequests
end
