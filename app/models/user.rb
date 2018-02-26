class User < ApplicationRecord

  has_one :team

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :recoverable, :rememberable


  def full_name
    [first_name, last_name].join(' ')
  end

  def self.from_omniauth(auth)
    find_or_create_by(uid: auth['uid'].to_s) do |u|
      u.provider   = auth['provider']
      u.first_name = auth['info']['first_name'] || ''
      u.last_name  = auth['info']['last_name'] || ''
    end
  end

  def assign_credentials(credentials)
    #  our db column, auth credentials
    [
      ['auth_token',       'token'],
      ['refresh_token',    'refresh_token'],
      ['token_expires_at', 'expires_at']
    ].each do |mapping|
      self[mapping[0]] = credentials[mapping[1]]
    end

    save
    self
  end
end
