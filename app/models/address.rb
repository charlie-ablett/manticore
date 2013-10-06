class Address < ActiveRecord::Base
  has_one :city
end
