class User < ActiveRecord::Base
  #include Searchable
  has_one :address


  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase }

  def self.search_results query_text
    query_bits = query_text.split('.') #get attribute
    name = query_bits[0].gsub!(/\A"|"\Z/, '')
    attribute = query_bits[1]
    results = []
    if (attribute && User.reflections.keys.include?(:"#{attribute}")) || name
      results = User.where("name LIKE ?", name)
    end
  end


end
