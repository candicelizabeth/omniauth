class User < ApplicationRecord
  has_secure_password #authenticate, password=, validate 
end