class Answer
  include MongoMapper::Document

  key :answer, String
  key :type, String
  key :question, String
  timestamps!

  def self.search(params)
    all
  end
end
