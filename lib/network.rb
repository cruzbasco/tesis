require "redis"
require "oj"

class Network
  
  attr_accessor :forms, :entity_type, :entity_relationship, :nodes
  
  def initialize
    @forms = []
    @redis = Redis.new
    @entity_type = ["Team", "Person", "Training", "Project"]
    @entity_relationship = {"Team" => ["Team", "Person", "Project"], 
                            "Person" => ["Team","Project","Training"],
                            "Project" => ["Team", "Person"]}
    @nodes = Hash.new
  end
  
  def save_form (form)
    @redis.set(form.form_name, Oj::dump(form))
    @redis.sadd("forms", form.form_name)
  end
  
  def get_forms
    @redis.smembers("forms").each do |form|
      @forms.push(get_form(form))
    end
    @forms
  end
  
  def get_form (form)
    Oj.load(@redis.get(form))
  end
  
  def delete_form (form)
    @redis.del(form)
    @redis.srem("forms",form)
  end
  
end