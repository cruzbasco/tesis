class Form
  
  attr_accessor :main_attribute,:attributes, :entity_type
    
  def initialize (name, entity_type)
    @entity_type = entity_type
    @main_attribute = Attribute.new("Formulario",name,TextType.new)
    @attributes = Hash.new
  end
  
  def get_main_value
    @main_attribute.value
  end
  
  def add_attribute (attribute)
    @attributes[attribute.property] = attribute
  end
  
  def remove_attribute (attribute)
    @attributes.delete(attribute.property)
  end
  
  # def search_attribute (data)
  #   @attributes.select{|attribute| attribute.property == data || attribute.value == data}.first
  # end
  
  def get_attributes_values
    @attributes.values
  end

  def set_attributes(attributes)
    @attributes = attributes
  end
  
end