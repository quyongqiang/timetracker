class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company
  
  has_many :works
  has_many :projects, :through => :works

  # 09_01 added
  has_many :projects

  # test
  scope :brian, -> { where("fname == 'Brian'")}

  validates :fname, length: { minimum: 2 }
  validates :lname, length: { minimum: 5 }
  validates :company, presence: true

  def to_s
    "#{fname} #{lname}"
  end
end
