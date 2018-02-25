class CommandSerializer < ActiveModel::Serializer

  attributes :name, :owner, :is_owner


  def is_owner
    current_user ? current_user.id == object.user_id : false
  end

  def owner
    object.user.full_name
  end

end
