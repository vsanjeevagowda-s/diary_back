class User < ActiveRecord::Base
  has_many :records
  has_many :expenses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def ensure_authtoken
         	self.auth_token = generate_token
         	self.save!
         	self.auth_token
         end

         private
         def generate_token
         	Devise.friendly_token	
         end
end
