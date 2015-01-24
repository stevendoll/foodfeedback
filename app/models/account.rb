class Account < ActiveRecord::Base
  #belongs_to :creator, :class_name  => 'User'
  #validates_presence_of  :creator

  has_many :users

  validates :name, presence: true #, uniqueness: { case_sensitive: false }
end
