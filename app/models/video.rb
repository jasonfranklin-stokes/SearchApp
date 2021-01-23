class Video < ApplicationRecord
  belongs_to :subject
  scope :filter_by_title_contains, ->(term) { where("title like ?", "%#{term}%") }
  scope :filter_by_subject_name_contains, ->(term) { joins(:subject).where("subjects.name like ?", "%#{term}%") }
end
