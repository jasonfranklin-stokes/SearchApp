module VideoService
  class Search
    def self.store(params)
      sf = SearchFilter.new(params)
      OpenStruct.new({
        success?: true,
        payload: Video.title_contains(sf.by_title).
          subject_name_contains(sf.by_subject),
      })
    end
  end
end
