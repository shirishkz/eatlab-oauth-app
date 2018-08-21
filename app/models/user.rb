class User < ApplicationRecord
  belongs_to :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  before_validation :assign_role

  def assign_role
    self.role = Role.find_by_name('Member') if self.role.nil?
  end

  def admin?
    self.role.name == 'Admin' if !self.role.blank?
  end
  def member?
    self.role.name == 'Member' if !self.role.blank?
  end
end
