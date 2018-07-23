class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = @@max_speed
    end
    if strength > @@max_strength
      @strength = @@default_strength ##might be default_speed
    else
      @strength = @@max_strength
    end
  end

  def self.plague_level
    @@plague_level
  end


  def self.all
    @@horde
  end

  def self.spawn
    rand(@@plague_level).times do
      @@horde << self.new(rand(@@max_speed), rand(@@max_strength))
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(0..3)
  end

  def self.some_die_off
    rand(0..11).times do
      @@horde.delete(@@horde.sample)
    end
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end

  def encounter
    if outrun_zombie == true
      return "You got away from the zombie!"
    elsif outrun_zombie == false && survive_attack == true
      @@horde << initialize(rand(@@max_speed), rand(@@max_strength))
        return "You turned into a zombie!"
    elsif outrun_zombie ==false && survive_attack == false
        return "You have died"
    else
      return "You got away from the zombie!"
    end
  end

  def outrun_zombie
    run_speed = rand(@@max_speed)
    if run_speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack
    random_strength = rand(@@max_strength)
    if random_strength > @strength
      return true
    else
      return false
    end
  end
end



carl = Zombie.new(3, 3)
Zombie.spawn
puts Zombie.all
puts "It's a new day"
Zombie.new_day
puts Zombie.all
puts Zombie.plague_level


zombie1 = Zombie.all[0]

puts zombie1.encounter

# puts Zombie.all.inspect # []
# Zombie.new_day
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
# zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
# puts zombie1.encounter # You are now a zombie
# puts zombie2.encounter # You died
# puts zombie3.encounter # You died
# Zombie.new_day
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
# zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
# puts zombie1.encounter # You got away
# puts zombie2.encounter # You are now a zombie
# puts zombie3.encounter # You died
