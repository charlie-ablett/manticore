class QueryObject

  def initialize
    @attribute = nil
    @new_value = nil
    @disambiguations = []
    @target_classes = []
  end

  def new_value
    @new_value
  end

  def attribute
    @attribute
  end

  def disambiguations
    @disambiguations
  end

  def target_classes
    @target_classes
  end

  def new_value= (value)
    @new_value = value
  end

  def attribute= (value)
    @attribute = value
  end

  def target_classes= (value)
    @target_classes = value
  end

  def disambiguations= (value)
    @target_classes = value
  end

end