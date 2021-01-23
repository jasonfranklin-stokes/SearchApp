class Video < ApplicationRecord
  belongs_to :subject
  scope :title_contains, ->(term) { where("title like ?", "%#{term}%") }
  scope :subject_name_contains, ->(term) { joins(:subject).where("subjects.name like ?", "%#{term}%") }
end
