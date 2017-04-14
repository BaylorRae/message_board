class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :messages
  has_many :post_messages

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def display_name
    full_name.present? ? full_name : email
  end
end
