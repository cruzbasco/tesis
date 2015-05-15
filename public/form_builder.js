var button_up = '<td><a href="#" onclick="move_up(this)" class="btn btn-info move up"><span class="glyphicon glyphicon-arrow-up"></span></a></td>'
var button_down = '<td><a href="#" onclick="move_down(this)" class="btn btn-info move down"><span class="glyphicon glyphicon-arrow-down"></span></a></td>'
var button_edit = '<td><a href="#" class="btn btn-success disabled"><span class="glyphicon glyphicon-edit"></span></a></td>'
var button_delete = '<td><a href="#" onclick="delete_row(this)" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></a></td>'

$(document).ready(function(){

	$('#float_modal').on('shown.bs.modal', function () {
	    $('#label').focus();
	});
	
	$("#new_field").on('click', function () {
		$("center h2").append($("#new_field").text());
	});

	function add_custom_attribute () {
		var label = $("#label").val();
		var type = $("#type option:selected").val();
		var field_label = "<label class='control-label col-sm-2 form_field' for='"+label+"'>"+label+"</label>"
		var field_type = "<div class='col-md-8'><input id='"+label+"' name='"+label+"' type='"+type+"' class='form-control input-md'></div>"
		var field_hidden = "<input type='hidden' name='"+label+"_type' value='"+type+"'>"
		var full_field = "<td><div class='form-group'>"+field_label+field_type+"</div>"+field_hidden+"</td>"
		$("tbody.body").append("<tr>"+full_field+button_up+button_down+button_edit+button_delete+"</tr>"); 
	}

	$("#save").on('click',function() {		
		if ($("#label").val() != "") {
			add_custom_attribute();	
			$("#float_modal").modal('hide');
			clean_modal();	
		}
	});

	$("#label").on('keypress', function(e) {
		if (e.which ==13 && $("#label").val() != ""){
			add_custom_attribute();	
			$("#float_modal").modal('hide');
			clean_modal();
		}
	});

	$("#close_modal").on('click', clean_modal);


});

function clean_modal() {
		$("center h2").text('');
		$("#label").val('');
	}

	function move_up(r) {
		var row = $(r).closest('tr');
		row.prev().before(row);	
	}

	function move_down(r) {
		var row = $(r).closest('tr');
		row.next().after(row);
	}

	function delete_row(r) {
	    var i = r.parentNode.parentNode.rowIndex;
	    document.getElementById("formTable").deleteRow(i);
	}


