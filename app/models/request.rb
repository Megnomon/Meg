class Request < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  belongs_to :partscore
  belongs_to :pbass
  belongs_to :pdrum
  belongs_to :pkeyboad
  belongs_to :dictation
  belongs_to :dbass
  belongs_to :ddrum
  belongs_to :dkeyboard
  belongs_to :dchorus
end
