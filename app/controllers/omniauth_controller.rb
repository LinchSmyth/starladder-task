class OmniauthController < ApplicationController
  skip_before_action :render_layout

  def callback
    user = User.from_omniauth(oauth_hash)
               .assign_credentials(oauth_hash('credentials'))

    sign_in(user, scope: :users)

    uri_query = '?success=true'

    # we'll ask user to complete fields that is not present but required
    incomplete_fields = ['first_name', 'last_name'].map do |field|
      user[field].present? ? nil : field
    end.compact

    if incomplete_fields.present?
      uri_query << "&incomplete=#{incomplete_fields.join('&incomplete=')}"
    end

    redirect_to login_users_url.concat(uri_query)
  end


  private


  def oauth_hash(field = nil)
    field ? request.env['omniauth.auth'][field] : request.env['omniauth.auth']
  end
end
