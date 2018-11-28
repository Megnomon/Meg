class Dictation < ApplicationRecord
  belongs_to :user
  has_many :dgrequests
end
