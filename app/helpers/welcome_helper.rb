module WelcomeHelper
  def greetings
    if current_user && !current_user.name.nil? 
      "Hello Judge #{current_user.name}"
    elsif current_user
      "Hello Judge #{current_user.email}"
    end
  end
end
