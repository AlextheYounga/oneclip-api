class User < ApplicationRecord
    has_many :clipboards
    has_secure_password
end
