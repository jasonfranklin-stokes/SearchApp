module VideoService
  class Search
    def self.using_filters(ts)
      t = ts.fetch(:title, "")
      s = ts.fetch(:subject, "")
      OpenStruct.new({
        success?: true,
        payload: Video.filter_by_title_contains(t).filter_by_subject_name_contains(s),
      })
    end
  end
end
