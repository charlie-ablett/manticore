class Chainable

  def execute
    self.process
    if @next
      @next.queryObject = @queryObject
      @next.queryString = @queryString
      @next.execute
    else
      return @queryObject
    end
  end

  def process

  end

  def nextValidator=(nextValidator)
    @next = nextValidator
  end

  def queryObject=(queryObject)
    @queryObject = queryObject
  end

  def queryString=(queryString)
    @queryString = queryString
  end

end