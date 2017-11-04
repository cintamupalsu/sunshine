class ChaptersController < ApplicationController
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      chapter_search_term = ChapterSearchTerm.new(@keywords)
      @chapters = Chapter.where(
        chapter_search_term.where_clause,
        chapter_search_term.where_args).
        order(chapter_search_term.order)
    else
      @chapters = []
    end
  end
end