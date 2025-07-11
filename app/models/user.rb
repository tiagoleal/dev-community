class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, authentication_keys: [ :login ]

  has_many :work_experiences, dependent: :destroy
  has_many :connections, dependent: :destroy

  validates :first_name, :last_name, :profile_title, presence: true
  validates :username, presence: true, uniqueness: true

  PROFILE_TITLE = [
    "Senior Ruby on Rails Developer",
    "Full Stack Ruby on Rails Developer",
    "Senior Full Stack Ruby on Rails Developer",
    "Junior Full Stack Ruby on Rails Developer"
  ].freeze

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where([ "lower(username) = :value OR lower(email) = :value", { value: login.strip.downcase } ]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
      # conditions[:email]&.downcase!
      # find_by(conditions)
    end
  end

  def connected_user_ids
    connections.pluck(:connected_user_id)
  end

  def connected_users
    User.where(id: connected_user_ids)
  end

  def self.not_connected_users(user)
    where.not(id: user.connected_user_ids + [ user.id ])
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def address
    return nil if city.blank? && state.blank? && country.blank? && pincode.blank?

    "#{city}, #{state}, #{country}, #{pincode}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[country city]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def my_connection(user)
    Connection.where("(user_id= ? AND connected_user_id = ?) OR (user_id= ? AND connected_user_id = ?)", user.id, id, id, user.id)
  end

  def check_if_already_connected?(user)
    self != user && !my_connection(user).present?
  end

  def mutually_connected_ids(user)
    self.connected_user_ids.intersection(user.connected_user_ids)
  end
end
