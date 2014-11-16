class NumericType
  def initialize ()
  end
  
  def editable (property, value)
    "<div class='form-group'><label class='control-label col-sm-2' for='#{property}'>#{property}:</label><div class='col-md-8'><input name='#{property}' type='number' value='#{value}' class='form-control input-md'/></div></div><input type='hidden' name='#{property + '_type'}' value='number'>"
  end
  
  def non_editable (property, value)
    "<div class='form-group'><label class='control-label col-sm-2'>#{property}</label><div class='col-md-8'><input type='text' value='#{value}' class='form-control input-md' readonly></div></div><input type='hidden' name='#{property + '_type'}' value='number'>"
  end
end