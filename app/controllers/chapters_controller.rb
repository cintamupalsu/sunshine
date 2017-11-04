class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all.limit(10)
  end
end