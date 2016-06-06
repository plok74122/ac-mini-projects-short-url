class ShortUrlList < ActiveRecord::Base
  validates_presence_of :redirect_to
  #before_create 資訊請參考https://ihower.tw/rails4/activerecord-lifecycle.html 中的call back
  before_create :random_unique_string

  private
  def random_unique_string
    unique_string = SecureRandom.hex(5)
    while ShortUrlList.find_by_unique_string( unique_string ).present? do
      unique_string = SecureRandom.hex(5)
    end
    self.unique_string = unique_string
  end
end
