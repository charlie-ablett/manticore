class AttributeValidator < Chainable
  @classes

  def process
    if @queryObject.attribute == nil && @queryObject.newValue == nil

    else
      possible_classes_for_assignment = get_possible_classes(@queryObject.attribute)
      if possible_classes_for_assignment.size == 0
        @queryObject.disambiguations.push(@queryObject.attribute)
        @queryObject.attribute = nil
      end
      @queryObject.target_classes = possible_classes_for_assignment
    end
  end

  def get_possible_classes(attribute)
    results = []
    @classes.each do |klass|
      if klass.tap{}.reflections.keys.include?(:"#{attribute}")
        results.append (klass)
      end
    end
    results
  end

  def classes= value
    @classes = value
  end

end