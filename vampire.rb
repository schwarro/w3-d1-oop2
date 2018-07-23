class Vampire
  @@coven = []

  def initialize(name, age, in_coffin, drank_blood_today)
    @name = name
    @age = age
    @in_coffin = in_coffin
    @drank_blood_today = drank_blood_today
  end

  def self.create(name, age, in_coffin, drank_blood_today)
    new_vampire = self.new(name, age, in_coffin, drank_blood_today)
    @@coven.push(new_vampire)
    return new_vampire
  end

  def self.all
    return @@coven
  end

  def drink_blood_today
    @drank_blood_today = true
  end

  def drank_blood_today
    return @drank_blood_today
  end

  def drank_blood_today=(drank_blood_today) #boolean
    @drank_blood_today = drank_blood_today
    return @drank_blood_today
  end

  def in_coffin
    return in_coffin
  end

  def in_coffin=(in_coffin) #boolean
    @in_coffin = in_coffin
    return @in_coffin
  end

  def go_home
    @in_coffin = true
  end

  def self.sunrise
    @@coven.each do |vampire|
      if vamp.drank_blood_today == false || vamp.in_coffin == false
        @@coven.delete(vampire)
      end
    end
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.drank_blood_today = false
      vampire.in_coffin = false
    end
  end

end


vampire1 = Vampire.create('Rob', 30, false, false)
vampire1.drink_blood_today
p vampire1
p Vampire.all
Vampire.sunset
puts "Sunset happens"
p Vampire.all
vampire1.go_home
puts "He went home"
p vampire1
