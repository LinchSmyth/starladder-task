class Tournament < ApplicationRecord

  has_many :commands

  validates :name, presence: true, length: { minimum: 2 }

end
