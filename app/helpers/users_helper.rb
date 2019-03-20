module UsersHelper
  def avatar(user, options = {})
    email_hash = Digest::MD5.hexdigest(user.email)
    size = options[:size] || 120
    url = "https://gravatar.com/avatar/#{email_hash}?s=#{size}"

    image_tag url, alt: 'Avatar Image', class: options[:class]
  end
end
