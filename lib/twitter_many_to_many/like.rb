class Like 
  @@all = []
  def self.all 
    @@all 
  end

  attr_reader :tweet,:user 

  def initialize(attributes = {})
    @tweet = attributes[:tweet]
    @user = attributes[:user]
    @@all << self
  end

end