class Pkeyboard < ApplicationRecord
  belongs_to :user
  has_many :pkrequests
end
