module UsersHelper
  def full_name(user)
    user.first_name + ' ' + user.last_name
  end

  def username(user)
    '@' + user.email.downcase.sub(/@.+/, '')
  end
end
