class Command < ApplicationRecord

  belongs_to :user
  belongs_to :tournament

  validates :name, :logo, presence: true
  validate  :user_tournament_uniqueness

  mount_uploader :logo, LogoUploader


  private


  def user_tournament_uniqueness
    if Command.where(tournament_id: tournament.id, user_id: user.id).any? && !self.id
      errors.add(:base, 'you have already registered a team on this tournament')
    end
  end

end
