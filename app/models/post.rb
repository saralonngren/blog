# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  author     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  has_one_attached :featured_image
  has_rich_text :content

  has_many :categories

  def reading_time
    words_per_minute = 150
    text = Nokogiri::HTML(self.content.body).inner_text
    (text.scan(/\w+/).length / words_per_minute).to_i
  end
end
