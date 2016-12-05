module NightsHelper
  def notes_array(night)
    night.notes.split("<br>") 
  end

  def logs_array(night)
    night.logs.split("<br>") 
  end
end
