class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :image, :name, 
      :password_digest,:password_confirmation, :password

  validate :email, prescence: true
  validate :email, uniqueness: true

end
