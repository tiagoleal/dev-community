class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  PROFILE_TITLE = [
    'Senior Ruby on Rails Developer',
    'Full Stack Ruby on Rails Developer',
    'Senior Full Stack Ruby on Rails Developer',
    'Junior Full Stack Ruby on Rails Developer'
  ].freeze

  def name
    "#{first_name} #{last_name}".strip
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[country city]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
