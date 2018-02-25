class Command < ApplicationRecord

  belongs_to :user
  belongs_to :tournament

  validates :name, :logo, presence: true

  mount_uploader :logo, LogoUploader

end
