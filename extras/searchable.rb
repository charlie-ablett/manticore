module Searchable

  def self.included base
    base.extend ClassMethods
  end

  def my_name
    "My name!"
  end

  module ClassMethods
    def self.search_results
      puts "CLASS NAME=" + self.class.name #class name - will it return the actual class or will it return Search? To be discovered.
      puts "Demodularised class name=" + self.class.name.demodulize
      User.first
    end
  end

end
