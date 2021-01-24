module VideoService
  class Search

    #
    # Public
    #
    # purpose: find video depending on filter values
    # scope: video.title and/or (subject.name or subject_id)
    # qualifications:
    # search for sub-string of video title
    #  - will find all if no string given
    # search for sub-string of video subject
    #  - will find all if no string given
    # search for videos with subject_id
    #  - takes presedece over sub-string of subject

    def self.store(params)
      OpenStruct.new({
        success?: true,
        payload: compose_payload(SearchFilter.new(params)),
      })
    end

    #
    # Private
    #

    def self.compose_payload(filter)
      query = with_title(Video, filter)
      query = with_subject(query, filter)
      with_subject_id(query, filter)
    end

    def self.with_subject(query, filter)
      filter.by_subject_id ? query : query.subject_name_contains(filter.by_subject)
    end

    def self.with_title(query, filter)
      query.title_contains(filter.by_title)
    end

    def self.with_subject_id(query, filter)
      filter.by_subject_id.present? ? query.subject_id_is(filter.by_subject_id) : query
    end

    class << self
      private :compose_payload
      private :with_subject
      private :with_title
      private :with_subject_id
    end
  end
end
