# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  author     :string
#  subtitle   :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  has_one_attached :featured_image
  has_rich_text :content

  has_and_belongs_to_many :categories

  scope :with_categories, -> { includes(:categories).where.not(categories: { id: nil }) }

  def reading_time
    words_per_minute = 150
    text = Nokogiri::HTML(self.content.body.html_safe).inner_text
    (text.scan(/\w+/).length / words_per_minute).ceil
  end
end
