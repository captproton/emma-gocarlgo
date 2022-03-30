class User < ApplicationRecord
  include ActionText::Attachable
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

  scope :contact_message_team,     -> { where("contact_message_receiver = ?", true)}

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services

end
