class Tweet 
  @@all = []

  def self.all
    @@all
  end

  attr_reader :message, :user
  def initialize(attributes = {})
    @message = attributes[:message]
    @user = attributes[:user]
    @@all << self
  end

  def username 
    user.username
  end

  def delete 
    Tweet.all.delete(self) 
  end

  def likes # has many of join
    Like.all.select {|like| like.tweet == self}
  end

  def liker # has many through join
    likes.map {|like| like.user}
  end

end