class Work < ActiveRecord::Base
  belongs_to :project
  belongs_to :user  

  validates :project, presence: true
  validates :user, presence: true
  validates :datetimeperformed, presence: true

  # 注意此处为 validate，而不是validates
  validate :date_is_in_past
  validates :hours, numericality: { only_integer: true,
                                     greater_than: 0, 
                                     less_than_or_equal_to: 8 }

  def date_is_in_past
    if datetimeperformed.present? && datetimeperformed > Time.now
      errors.add(:datetimeperformed, "can't be in the future")
    end
  end

  scope :fullday, -> { where("hours >= 8")}
  scope :recent, -> { where("datetimeperformed > '#{Time.now - 7.days}' ")}
end
