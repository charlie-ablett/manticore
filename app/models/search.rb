require 'queryProcessing/query_text_processor'
require 'queryProcessing/query_object'

class Search

  @query_object = nil
  @current_result_set = []

  def search_results (text)
    validate_query_string(text)
    get_results(@query_object)
  end

  def validate_query_string(text)
    processor = QueryTextProcessor.new
    processor.buildChain
    processor.process(text)
  end

  def get_results(text)

  end

end
