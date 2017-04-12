class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable, :lockable
  attr_accessor :current_password
  belongs_to :event_department
  belongs_to :event_department_stream
  validates :phone_no, :uniqueness => true, :allow_blank => true
end
