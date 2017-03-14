class Game < ApplicationRecord
  has_many :games_genres
  has_many :genres, through: :games_genres

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

  def add_genre(genre_name)
    genre = Genre.find_by(name: genre_name)
    self.games_genres.create(genre: genre) unless genre.nil?
  end
end
