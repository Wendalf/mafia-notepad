module NightsHelper
  def notes_array(night)
    night.notes.split(".") 
  end

  def logs_array(night)
    night.logs.split(".") 
  end
end
