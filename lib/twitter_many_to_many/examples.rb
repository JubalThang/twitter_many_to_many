class Aquarium 
    @@all = []

    def initialize(arg)
        @name = arg[:name]
        @@all << self
    end

    def self.all
        @@all
    end

    def exhibits # has_many relation to Exhibit
        Exhibit.all.select {|exhibit| exhibit.aquarium == self}
    end

    def fish # has_many through
        exhibits.flat_map {|exhibit| exhibit.fish}
    end
end

class Exhibit 
    @@all = []
    attr_accessor :name, :aquarium
    def initialize(arg)
        @name = arg[:name]
        @aquarium = arg[:aquarium]
        @@all << self
    end

    def self.all
        @@all
    end

    def fish #has_many
        Fish.all.select {|fish| fish.exhibit == self}
    end
end

class Fish 
    @@all = []

    attr_accessor :name, :exhibit

    def initialize(arg)
        @name = arg[:name]
        @exhibit = arg[:exhibit]
        @@all << self
    end

    def self.all 
        @@all 
    end
end


class Doctor 
    @@all = []

    attr_reader :name 

    def initialize(arg)
        @name = arg[:name]
        @@all << self
    end

    def self.all
        @@all 
    end

    def appointments
        Appointment.all.select do |appointment| appointment.doctor == self end
    end

    def patients 
        # Patient.all.select {|patient| patient.doctor == self }
        appointments.map { |appointment| appointment.patient }.uniq
    end

end 

class Patient
    @@all = []

    attr_accessor :name, :doctor

    def initialize(arg)
        @name = arg[:name]
        @doctor = arg[:doctor]
        @@all << self   
    end

    def self.all 
        @@all
    end

    def appointments 
        Appointment.all.select {|appointment| appointment.patient == self}
    end

    def doctors 
        appointments.map {|appointment| appointment.doctor}
    end
end

class Appointment
    @@all = []

    attr_accessor :time, :doctor, :patient

    def initialize(arg)
        @time = arg[:time]
        @doctor = arg[:doctor]
        @patient = arg[:patient]
        @@all << self
    end

    def self.all 
        @@all
    end

end