module VideoService
  class SearchFilter
    def initialize(params)
      search_term_as_array = params[:search_term].split
      @terms = [
        search_term_as_array[0..-2].join(" "),
        search_term_as_array.last,
      ].uniq
    end

    def by_title
      @terms[0]
    end

    def by_subject
      @terms[1]
    end
  end
end
