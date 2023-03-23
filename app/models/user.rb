class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }

  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true

  has_many :tasks, dependent: :destroy

  before_update :admin_cannot_update
  before_destroy :admin_cannot_delete

  private

  def admin_cannot_update
    throw :abort if User.exists?(admin: true) && self.admin_change_to_be_saved == [true, false]
  end

  def admin_cannot_delete
    throw :abort if User.exists?(admin: true) && self.admin
  end

end
