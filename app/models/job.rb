class Job < ActiveRecord::Base
  validates :job_class, presence: true
  validates :job_type, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :link, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user == owner
  end
end
