require "date"

class Node
  attr_accessor :code, :version_stamp, :entity_type, :form_type, :create_date, :update_date
  
  def initialize (code, entity_type, form_type, create_date)  
    @code = code
    @version_stamp = 0;
    @entity_type = entity_type
    @form_type = form_type
    @create_type = DateTime.strptime(create_date,"%d-%m-%Y %H:%M")
    @update_date = DateTime.now
    @attributes = Hash.new
  end
  
  def create_date
    @create_date.strftime("%d-%m-%Y %H:%M")
  end
  
  def update_date
    @update_date.strftime("%d-%m-%Y %H:%M")
  end
  
  def add_attribute (attribute)
    @attributes[attribute.property] = attribute
  end
  
  def remove_attribute (attribute)
    @attributes.delete(attribute.property)
  end
  
  def get_attributes_values
    @attributes.values
  end

  def set_attributes (attributes)
    @attributes = attributes
  end
  
  def check_version (node)
    @version_stamp == node.version_stamp
  end
  
  def increment_version_stamp
    @version_stamp+= 1
  end
  
end