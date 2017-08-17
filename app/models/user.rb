class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum roles: %I[user admin]

  has_many :images, as: :imageable, dependent: :destroy
 	accepts_nested_attributes_for :images, allow_destroy: true
end