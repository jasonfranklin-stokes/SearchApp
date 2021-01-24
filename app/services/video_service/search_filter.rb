module VideoService
  class SearchFilter
    def initialize(params)
      @query_title = params[:query_title]
      @query_subject = params[:query_subject]
      @subject_id = params[:subject_id]
    end

    def by_title
      @query_title
    end

    def by_subject
      @query_subject
    end

    def by_subject_id
      @subject_id
    end
  end
end
