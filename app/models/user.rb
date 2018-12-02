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
  has_many :pbrequests, dependent: :destroy
  has_many :pdrequests, dependent: :destroy
  has_many :pkrequests, dependent: :destroy
  has_many :dgrequests, dependent: :destroy
  has_many :dbrequests, dependent: :destroy
  has_many :ddrequests, dependent: :destroy
  has_many :dkrequests, dependent: :destroy
  has_many :dcrequests, dependent: :destroy
  has_many :d_choruses, dependent: :destroy
end
