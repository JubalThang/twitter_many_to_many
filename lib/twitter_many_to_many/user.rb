class User 
  @@all = []

  def self.all 
    @@all 
  end
  attr_reader :username
  def initialize(attributes = {})
    @username = attributes[:username]
    @@all << self
  end

  def post_tweet(message)
    Tweet.new(message, self)
  end

  def tweets
    Tweet.all.select { |tweet| tweet.user == self}
  end
  
  def likes # has_many
    Like.all.select { |tweet| tweet.user == self}
  end
  
  def liked_tweets # has_many trough
    likes.map {|like| like.tweet}
  end
end

  