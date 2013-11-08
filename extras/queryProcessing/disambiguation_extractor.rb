class DisambiguationExtractor < Chainable

  def process
    query_terms = @queryString.split(',')
    query_terms.pop

    query_terms.each do |term|
      @queryObject.disambiguations.add(term)
    end

  end

end