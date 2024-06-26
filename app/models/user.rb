class User < ApplicationRecord
  has_many :prototype
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true   
  validates :profile, presence: true   
  validates :occupation, presence: true
  validates :position, presence: true
end
