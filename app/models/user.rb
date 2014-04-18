class User < ActiveRecord::Base

  has_secure_password
  has_many :concerts
  validates_uniqueness_of :email, :name
end
