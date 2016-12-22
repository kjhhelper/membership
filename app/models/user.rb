class User < ApplicationRecord
  has_secure_password
  has_many :groups
  has_many :joins
  has_many :joined_groups, :through => :joins, :source => :user

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

validates :f_name, :l_name, :email, presence: true
validates :email, uniqueness: {case_sensitive: false}, format: { with: email_regex }
validates :password, presence:true
end
