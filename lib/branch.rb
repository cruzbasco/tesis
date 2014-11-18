class Branch
  
  attr_accessor :type, :code_node
  
  def initialize (type, code_node)
    @type = type
    @code_node = code_node
  end
  
end