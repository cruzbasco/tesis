require "redis"
require "oj"

class RedisPersistance
  
  def initialize
    @redis = Redis.new
  end
  
  
  def guardar (entity)
    @redis.set 
  end
  
  def recuperar_todos
    
  end
  
end

redis = Redis.new

redis.set "vania", ["elite","knight",185].to_json

puts JSON.parse (redis.get("vania"))

redis.sadd("hi", "hola")
redis.sadd("hi", "hi")
redis.sadd("hi", "sup")

puts redis.smembers "hi"

class Tibia
  attr_accessor :profesions, :promotions, :cities
  
  def initialize
    @profesions = ["knight", "paladin", "mage", "druid"]
    @promotions = ["elite", "royal", "master", "elder"]
    @cities = ["thais", "venore", "carlin", "edron", "darashia"]
  end
  
  def show_all
    show(@profesions)
    show(@promotions)
    show(@cities)
  end
  
  def show(array)
    puts array.to_s
  end
  
end

tibia = Tibia.new

redis.set "tibia", Oj::dump(tibia)

t = Oj.load(redis.get("tibia"))

t.show_all