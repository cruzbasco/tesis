require "redis"
require "oj"

class Network
  
  attr_accessor :forms, :entity_types, :nodes
  
  def initialize
    @redis = Redis.new
    @entity_types = ["team", "person", "training", "project"]
    @entity_relationship = {"team" => ["team", "person", "training", "project"], 
                            "person" => ["team","project","training"],
                            "project" => ["team", "person"]}
    @nodes = Hash.new
  end
  
  def save_form (form)
    @redis.set(form.get_main_value, Oj::dump(form))
    @redis.sadd("forms", form.get_main_value)
  end
  
  def get_forms
    @redis.smembers("forms")
  end
  
  def get_form (form)
    Oj.load(@redis.get(form))
  end
  
  def delete_form (form)
    @redis.del(form)
    @redis.srem("forms",form)
  end
  
end