class Submission
  include MongoMapper::Document

  one :person
  many :answers
  timestamps!

  def self.search(params)
    last
  end
end
