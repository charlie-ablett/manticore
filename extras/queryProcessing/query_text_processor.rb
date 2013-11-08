class QueryTextProcessor

  def buildChain
    attribute_extractor = AttributeExtractor.new()
    validate_attributes = AttributeValidator.new()
    validate_attributes.classes = [User, Address, City, Jurisdiction, Country]
    extract_disambiguations = DisambiguationExtractor.new()

    attribute_extractor.nextValidator = validate_attributes
    validate_attributes.nextValidator = extract_disambiguations

    @firstProcessor = attribute_extractor
  end

  def process queryString
    queryObject = QueryObject.new
    @firstProcessor.queryString = queryString
    @firstProcessor.queryObject = queryObject
    @firstProcessor.execute()
  end

end