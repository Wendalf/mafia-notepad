class DetermineDeath 

  def self.gotblocked(night_events)
    got_blocked = []  

    night_events.each do |character_name, player_id|
      character = Character.find_by(name: character_name)
      player = Player.find(player_id) if player_id != ""
      if character.block? && !!player
        got_blocked << player.character
      end
    end

    got_blocked
  end

  def self.gotkilled(night_events, night, got_blocked)
    got_killed = []

    night_events.each do |character_name, player_id|
      character = Character.find_by(name: character_name)
      player = Player.find(player_id) if player_id != ""
      if !!player
        night.logs << "#{character_name.capitalize} #{character.ability}ed #{player.name}."
        if character.kill? && !got_blocked.include?(character)
          player.assign_attributes(alive: false)
          got_killed << player
        elsif character.heal? && got_killed.include?(player) && !got_blocked.include?(character)
          got_killed.delete(player)
        end
      else 
        night.logs << "#{character_name.capitalize} #{character.ability}ed nobody."
      end
    end

    got_killed
  end

  def self.death_and_notes(got_killed, night)
    got_killed.each do |player|
      player.save
    end

    if got_killed.empty?
      night.notes << " No one got killed last night."
    else
      got_killed.each do |player|
        night.notes << "#{player.name} got killed last night." 
      end   
    end

  end

end
