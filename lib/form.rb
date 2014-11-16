require "date"

class Form
  
  attr_accessor :form_name, :attributes, :entity_type
    
  def initialize (name, entity_type, create_date)
    @entity_type = entity_type
    @form_name = name
    @attributes = Hash.new
    @create_date = DateTime.strptime(create_date,"%d-%m-%Y %H:%M")
    @update_date = DateTime.now
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

  def set_attributes(attributes)
    @attributes = attributes
  end
  
end