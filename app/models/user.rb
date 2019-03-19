class User < ApplicationRecord
  devise :database_authenticatable, :rememberable

  belongs_to :role

  has_many :applications
end
