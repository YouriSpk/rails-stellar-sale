class User < ApplicationRecord
  has_many :stars
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_admin_role

  private

  def set_admin_role
    admin_emails = ['youri.soposki@gmail.com', 'medocius2@gmail.com', 'basant179@gmail.com', 'giovanni.malesci@hotmail.com']
    self.admin = admin_emails.include?(email)
  end
end
