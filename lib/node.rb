require "date"

class Node
  attr_accessor :code, :entity_type, :form_type, :create_date, :update_date
  
  def initialize (code, entity_type, form_type, create_date)  
    @code = code
    @entity_type = entity_type
    @form_type = form_type
    @create_type = DateTime.strptime(create_date,"%d-%m-%Y %H:%M")
    @update_date = DateTime.now
    
  end
  
  def create_date
    @create_date.strftime("%d-%m-%Y %H:%M")
  end
  
  def update_date
    @update_date.strftime("%d-%m-%Y %H:%M")
  end
  
end