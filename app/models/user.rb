class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :purchases
  # has_many :games, through: :purchases

  has_one :address, dependent: :destroy # One address can have many users, but one user can only have one address
  has_many :games
  accepts_nested_attributes_for :address
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def address
    super || build_address
  end
end
