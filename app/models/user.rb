class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :library_entries, dependent: :destroy

  validates :username,
    presence: true,
    length: { minumum: 3, maximum: 32 },
    format: { with: /\A[a-zA-Z0-9]+\z/ },
    uniqueness: { case_sensitive: false }

end
