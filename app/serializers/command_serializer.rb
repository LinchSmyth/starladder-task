class CommandSerializer < ActiveModel::Serializer

  attributes :name, :owner, :is_owner, :logo_url, :registration_date


  def is_owner
    current_user ? current_user.id == object.user_id : false
  end

  def owner
    object.user.full_name
  end

  def registration_date
    object.created_at.strftime('%d %B %Y, %H:%M')
  end

end
