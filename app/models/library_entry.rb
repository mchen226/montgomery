class LibraryEntry < ApplicationRecord
  MAX_SCORE = 10
  MIN_SCORE = 0

  belongs_to :user
  belongs_to :game

  enum status_type: {
    playing: 1,
    planned: 2,
    completed: 3,
    on_hold: 4,
    dropped: 5
  }

  validates :status,
    inclusion: {
      in: status_types.values
    }


  validates :score,
    allow_nil: true,
    numericality: {
      only_integer: false,
      less_than_or_equal_to: MAX_SCORE,
      greater_than_or_equal_to: MIN_SCORE
    }
end
