class User < ActiveRecord::Base
  has_many :goals, dependent: :destroy
  validates_presence_of :first_name
end
