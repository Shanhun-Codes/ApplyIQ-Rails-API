class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
   :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
   has_one_attached :profile_picture
end
