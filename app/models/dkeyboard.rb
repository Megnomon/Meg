class Dkeyboard < ApplicationRecord
  belongs_to :user
  has_many :dkrequests
end
