module VideoService
  class SearchableSubjects
    #
    # purpose: provide only subjects used by videos as filter option
    # scope: returns subjects being used by videos
    #
    def self.all
      Subject.where(id: Video.searchable_subjects.map { |o| o.subject_id })
    end
  end
end
