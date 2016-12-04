module WelcomeHelper
  def greetings
    if current_user && !current_user.name.nil? 
      "HELLO #{current_user.name}"
    elsif current_user
      "HELLO #{current_user.email}"
    else
      "MAFIA NOTEPAD"
    end
  end
end
