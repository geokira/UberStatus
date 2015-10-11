class System < ActiveRecord::Base
  belongs_to :project
    default_scope -> {order(created_at: :desc)}
  validates :project_id, presence: true
    validates :profile, presence: true, length: { maximum: 65 }
end
