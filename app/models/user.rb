class User < ActiveRecord::Base
  has_secure_password
  validates :login, presence: true, uniqueness: true

end
