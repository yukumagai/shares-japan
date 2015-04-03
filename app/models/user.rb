class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :first_name, :last_name, presence: true, uniqueness: { case_sensitive: false }
  validates :screen_name, length: { maximum: 140 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 6..24 }, if: :password
  validates :password_confirmation, presence: true, if: :password

  mount_uploader :image, ImageUploader

  has_many :items, dependent: :destroy
end
