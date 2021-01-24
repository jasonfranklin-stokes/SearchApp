class VideoController < ApplicationController
  def index
    @search_params = permitted_search_params
    @videos = VideoService::Search.store(@search_params).
      payload.includes(:subject).limit(50).load
    @searchable_subjects = VideoService::SearchableSubjects.all.limit(50).load
  end

  private

  def permitted_search_params
    # use case for rescue
    # scenario: no query params in url
    params.require(:query).permit(:query_title, :query_subject, :subject_id) rescue params
  end
end
