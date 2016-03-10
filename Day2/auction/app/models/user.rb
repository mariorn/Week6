class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :bids
  
  validates :email, uniqueness: true
  validates :email, presence: true


  def find_by_email(address)
    User.where(email: address).first
  end


end
