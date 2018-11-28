class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :pbasses, dependent: :destroy
  has_many :pdrums, dependent: :destroy
  has_many :pkeyboards, dependent: :destroy
  has_many :partscores, dependent: :destroy
  has_many :dictations, dependent: :destroy
  has_many :dbasses, dependent: :destroy
  has_many :ddrums, dependent: :destroy
  has_many :dkeyboards, dependent: :destroy
  has_many :dchoruses, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :pgrequests, dependent: :destroy
  has_many :pbrequests
  has_many :pdrequests
  has_many :pkrequests
  has_many :dgrequests
  has_many :dbrequests
  has_many :ddrequests
  has_many :dkrequests
  has_many :dcrequests
end
