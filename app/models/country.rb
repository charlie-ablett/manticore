class Country < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 100 }
  #include Search
end
