require "redis"
require "oj"

class Network
  
  attr_accessor :forms, :entity_type, :entity_relationship, :nodes, :node_counter
  
  def initialize
    @forms = []
    @nodes = []
    @redis = Redis.new
    @entity_type = ["Equipo", "Persona", "Especialidad", "Proyecto"]
    @entity_relationship = {"Equipo" => ["Equipo", "Persona", "Proyecto"], 
                            "Persona" => ["Equipo", "Proyecto", "Especialidad"],
                            "Proyecto" => ["Equipo", "Persona"]}
    @nodes = Hash.new
    if has_node_counter? then
      @node_counter = @redis.get("node_counter")
    else
      @node_counter = 0
    end
    
  end
  
  def save_form (form)
    @redis.set(form.form_name, Oj::dump(form))
    @redis.sadd("forms", form.form_name)
  end
  
  def get_forms
    @redis.smembers("forms").each do |form_name|
      @forms.push(get_form(form_name))
    end
    @forms
  end
  
  def get_form (form_name)
    Oj.load(@redis.get(form_name))
  end
  
  def delete_form (form_name)
    @redis.del(form_name)
    @redis.srem("forms",form_name)
  end
  
  def save_node (node)
    @redis.set(node.code, Oj::dump(node))
    @redis.sadd(node.entity_type, node.code)
  end
  
  def get_nodes (entity_type)
    @redis.smembers(entity_type).each do |node_code|
      @nodes.push(get_node(node_code))
    end
    @nodes
  end
  
  def get_node (node_code)
    Oj.load(@redis.get(node_code))
  end
  
  def delete_node (node)
    @redis.del(node.code)
    @redis.srem(node.entity_type, node.code)
  end
  
  def save_root (node_code)
    @root = node_code
  end
  
  def get_root
    get_node(@root)
  end
  
  def exist_root?
    @root != nil
  end
  
  def has_node_counter?
    @redis.exists("node_counter")
  end
  
end








