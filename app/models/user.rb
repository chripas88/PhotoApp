class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_one :payment
  # during user sign up registrations - new form will hit users and payments table
  accepts_nested_attributes_for :payment
  has_many :images
end
