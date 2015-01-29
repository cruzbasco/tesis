class TextType
  def initialize ()
      
  end
  
  def editable (property, value)
    button_up = "<td><a href='#' onclick='move_up(this)' class='btn btn-info move up'><span class='glyphicon glyphicon-arrow-up'></span></a></td>"
		button_down = "<td><a href='#' onclick='move_down(this)' class='btn btn-info move down'><span class='glyphicon glyphicon-arrow-down'></span></a></td>"
		button_edit = "<td><a href='#' class='btn btn-primary disabled'><span class='glyphicon glyphicon-edit'></span></a></td>"
		button_delete = "<td><a href='#' onclick='delete_row(this)' class='btn btn-danger'><span class='glyphicon glyphicon-remove'></span></a></td>"
		field_label = "<label class='control-label col-sm-2' for='#{property}'> #{property}:</label>"
		field_type = "<div class='col-md-8'><input name='#{property}' type='text' value='#{value}' class='form-control input-md'/></div>"
		field_hidden ="<input type='hidden' name='#{property + '_type'}' value='text'>"
    "<tr><td><div class = 'form-group'>#{field_label}#{field_type}</div></td>#{field_hidden}#{button_up}#{button_down}#{button_edit}#{button_delete}</tr>"
  end
  
  def non_editable (property, value)
    field_label = "<label class='control-label col-sm-2'>#{property}</label>"
    field_type = "<div class='col-md-8'><input type='text' value='#{value}' class='form-control input-md' readonly></div>"
    "<div class='form-group'>#{field_label}#{field_type}</div>"
  end
end