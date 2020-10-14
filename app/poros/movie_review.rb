class MovieReview
  attr_reader  :author,
               :content,
               :content_snippet

  def initialize(review)
    @author = review[:author]
    @content = review[:content]
    @content_snippet = format_snippet(review[:content])
  end

  def format_snippet(snippet)
    snippet[0..350]
  end
end
