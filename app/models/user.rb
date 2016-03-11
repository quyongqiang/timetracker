class User < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :projects, :through => :works

  # test
  scope :brian, -> { where("fname == 'Brian'")}

  validates :fname, length: { minimum: 2 }
  validates :lname, length: { minimum: 5 }
  validates :company, length: presence: true


end
