class City < ActiveRecord::Base
  validates :name, presence: true
  has_one :jurisdiction
end
