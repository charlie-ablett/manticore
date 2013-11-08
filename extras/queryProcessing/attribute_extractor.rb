class AttributeExtractor < Chainable

  def process
    query_bits = @queryString.split(',')
    query = query_bits.pop

    attribute, new_value = get_assignment(query)

    @queryObject.attribute = attribute
    @queryObject.new_value = new_value
  end

  def get_assignment query
    attribute = ''
    new_value = nil
    assignment = query.split('=')

    if assignment.size == 2
      attribute = assignment.first
      new_value = assignment.last
    elsif assignment.size == 1
      attribute = assignment.first
    else
      attribute = nil
      new_value = nil
    end

    return attribute, new_value
  end

end