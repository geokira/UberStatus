class Project < ActiveRecord::Base
    has_many :systems, dependent: :destroy
    validates :name, presence: true, length: { maximum: 65 }
    validates :project_number_str, presence: true
    validates_uniqueness_of :name, scope: :project_number_str, case_sensitive: false
end
