class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :pbasses, dependent: :destroy
  has_many :pdrums, dependent: :destroy
  has_many :pkeyboads, dependent: :destroy
  has_many :partscores, dependent: :destroy
  has_many :dictations, dependent: :destroy
  has_many :dbasses, dependent: :destroy
  has_many :ddrums, dependent: :destroy
  has_many :dkeyboads, dependent: :destroy
  has_many :dchoruses, dependent: :destroy
  has_many :requests, dependent: :destroy
end
