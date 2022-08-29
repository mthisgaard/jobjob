class User < ApplicationRecord
            # Include default devise modules.
            include DeviseTokenAuth::Concerns::User
  has_many :jobs, dependent: :destroy
  has_many :tasks, through: :jobs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
