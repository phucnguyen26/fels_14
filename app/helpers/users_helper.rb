module UsersHelper
	def gravatar_for(user)
    		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    		gravatar_url = "http://www.gravatar.com/avatar/c6b98139dcb9341f75161b8f0e885fc9.png"
    		image_tag(gravatar_url, alt: user.name, class: "gravatar")
  	end
end
