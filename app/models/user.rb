class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :articles
   has_many :images
   before_create :set_permission_lvl
   def set_permission_lvl
		self.permission_lvl ||=0
	end
end
