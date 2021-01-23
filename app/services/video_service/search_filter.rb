module VideoService
  class SearchFilter
    def initialize(params)
      # TODO
      # this code tries to infer the subject and title from the same string
      # this is not the correct apprach,
      # as to do it properly would mean a lot of code and hitting the DB.
      # the subject and title should be passed in seperatly
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
