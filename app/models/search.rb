class Search

  @current_result_set = []

  def search_results
    []
  end

  @classes = [User, Address, City, Jurisdiction, Country]

  def parse_results(text)
    query_bits = text.split(',')
    query = query_bits.pop

    attribute = ""
    new_value = nil
    # DOESN'T NEED AN ASSIGNMENT! They may just be searching for a thing by name to look at it.
    attribute, new_value = get_assignment(query)

    results = []

    # get classes that have the attribute to get/set
    possible_classes_for_assignment = get_possible_classes(attribute)
    if possible_classes_for_assignment.size == 0
      #throw error - incorrect assignment
    end

    # get disambiguation exists
    get_disambiguation(query_bits)

    #if >1 result, request further disambiguation
    #if one result, make the change and return the result
    #if 0 results, return the result (empty set)


    @classes.each do |klass|
      if attribute && klass.tap{}.reflections.keys.include?(:"#{attribute}")
        results.append (klass.tap{}.where("#{attribute} LIKE ?", disambiguation))
      end
    end
  end

  def self.get_assignment query
    attribute = ""
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

  def get_possible_classes(attribute)
    #check if each class has an attribute equal to the assignment
    results = []
    @classes.each do |klass|
      if klass.tap{}.reflections.keys.include?(:"#{attribute}")
        results.append (klass)
      end
    end
    results
  end

  def self.get_disambiguation

  end


end
