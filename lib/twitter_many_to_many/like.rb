class Like 
  @@all = []
  def self.all 
    @@all 
  end

  def initialize(attributes = {})
    @tweet = attributes[:tweet]
    @user = attributes[:user]
    @@all << self
  end
end