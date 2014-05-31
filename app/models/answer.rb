class Answer
  include MongoMapper::Document

  key :answer, String
  key :type, String
  key :text, String
  many :doctors

  def self.search(params)
    all
  end
end
