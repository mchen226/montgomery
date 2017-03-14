class Game < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  MAX_SCORE = 10
  MIN_SCORE = 0

  belongs_to :developer, optional: true

  validates :title,
    presence: true,
    allow_nil: false,
    allow_blank: false,
    length: {maximum: 255}

  validates :score,
    allow_nil: true,
    numericality: {
      only_integer: false,
      less_than_or_equal_to: MAX_SCORE,
      greater_than_or_equal_to: MIN_SCORE
    }

  def add_tag(tag_name)
    tag = Tag.find_by(name: tag_name)
    self.tags << tag unless tag.nil?
  end
end
