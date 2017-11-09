class ChaptersController < ApplicationController
  PAGE_SIZE = 10
  def index
    @page = (params[:page] || 0).to_i
    if params[:keywords].present?
      @keywords = params[:keywords]
      chapter_search_term = ChapterSearchTerm.new(@keywords)
      @chapters = Chapter.where(
        chapter_search_term.where_clause,
        chapter_search_term.where_args).
        order(chapter_search_term.order).
        offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else
      @chapters = Chapter.all.offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    end
  end
end