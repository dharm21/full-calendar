class Member < ActiveRecord::Base
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:login]
  # model associations
    validates :mobile_no, uniqueness: true
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :replies, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :send_messages, class_name: "Message", :foreign_key=> 'sender_id'
    has_many :receive_messages, class_name: "Message", :foreign_key=> 'receiver_id'
    
    has_many :friendships, class_name: "Friendship", :foreign_key=> 'friend_id'
    has_many :invite_friendships, class_name: "Friendship", :foreign_key=> 'member_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  # Class methods
  def login=(login)
    @login = login
  end

  def login
    @login || self.mobile_no || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["mobile_no = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:mobile_no) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end