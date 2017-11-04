class ChapterSearchTerm
  attr_reader :where_clause, :where_args, :order
  def initialize(search_term)
    search_term = search_term.downcase
    @where_clause = ""
    @where_args = {}
    if search_term =~ /[A-Za-z]/
      build_for_latin_search(search_term)
    else
      build_for_arabic_search(search_term)
    end
  end
  private
    def build_for_latin_search(search_term)
      @where_clause << case_insensitive_search(:latin_name)
      @where_args[:latin_name] = starts_with(search_term)
      @order = "latin_name asc"
    end
    
    def starts_with(search_term)
      search_term + "%"
    end
    
    def case_insensitive_search(field_name)
      "lower(#{field_name}) like :#{field_name}"
    end
    
    def build_for_arabic_search(search_term)
      @where_clause << case_insensitive_search(:arabic_name)
      @where_args[:arabic_name] = starts_with(search_term)
      @order = "arabic_name asc"
    end
end