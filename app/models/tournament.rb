class Tournament < ApplicationRecord

  has_many :teams

  validates :name, presence: true, length: { minimum: 2 }

end
