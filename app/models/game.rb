class Game < ActiveRecord::Base
  MAX_SCORE = 10
  MIN_SCORE = 0

  belongs_to :developer

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

end
