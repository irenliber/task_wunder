class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  strip_attributes :only => [:full_name, :biography]
  validates :email, email: true
  validates :full_name, :email, :birth_date, :biography, presence: true

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
