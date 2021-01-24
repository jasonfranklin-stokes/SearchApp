class Video < ApplicationRecord
  belongs_to :subject
  scope :title_contains, ->(term) { where("title like ?", "%#{term}%") }
  scope :subject_name_contains, ->(term) { joins(:subject).where("subjects.name like ?", "%#{term}%") }
  scope :subject_id_is, ->(id) { joins(:subject).where("subjects.id = #{id}") }
  scope :searchable_subjects, -> { select(:subject_id).distinct }
end
