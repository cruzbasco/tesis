class Entity
  
  attr_accessor :main_attribute,:attributes, :id
    
  def initialize (name)
    @main_attribute = Attribute.new("Formulario",name,TextType.new)
    @attributes = []
  end
  
  def add_attribute (attribute)
    @attributes.push(attribute)
  end
  
  def remove_attribute (attribute_id)
    @attributes.delete_if{|attribute| attribute.object_id == attribute_id}
  end
  
  def search_attribute (data)
    @attributes.select{|attribute| attribute.property == data || attribute.value == data}.first
  end

  def set_attributes(attributes)
    @attributes=attributes
  end
  
end