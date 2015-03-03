$(document).ready(function(){

	$('#float_modal').on('shown.bs.modal', function () {
	    $('#label').focus();
	});
	
	$("#new_field").click(function () {
		$(".modal-header").html("<center><h2>"+$("#new_field").text()+"</h2></center>");
	});

	function add_custom_attribute () {
		var label = $("#label").val();
		var type = $("#type option:selected").val();
		var field_label = "<label class='control-label col-sm-2' for='"+label+"'>"+label+"</label>"
		var field_type = "<div class='col-md-8'><input id='"+label+"' name='"+label+"' type='"+type+"' class='form-control input-md'></div>"
		var field_hidden = "<input type='hidden' name='"+label+"_type' value='"+type+"'>"
		var button_up = "<td><a href='#' onclick='move_up(this)' class='btn btn-info move up'><span class='glyphicon glyphicon-arrow-up'></span></a></td>"
		var button_down = "<td><a href='#' onclick='move_down(this)' class='btn btn-info move down'><span class='glyphicon glyphicon-arrow-down'></span></a></td>"
		var button_edit = "<td><a href='#' class='btn btn-success disabled'><span class='glyphicon glyphicon-edit'></span></a></td>"
		var button_delete = "<td><a href='#' onclick='delete_row(this)' class='btn btn-danger'><span class='glyphicon glyphicon-remove'></span></a></td>"
		$("tbody.body").append("<tr><td><div class='form-group'>"+field_label+field_type+"</div>"+field_hidden+"</td>"+button_up+button_down+button_edit+button_delete+"</tr>"); 
	}

	$("#save").click(function(){
		if ($("#label").val() != "") {
			add_custom_attribute();	
			$("#float_modal").modal('hide');
		}
		$('#menu_flotante')[0].reset();
	});

});

function move_up(r) {
	var row = $(r).closest('tr');
	row.prev().before(row);	
}

function move_down(r) {
	var row = $(r).closest('tr');
	row.next().after(row);
}

function go_back() {
	window.history.back()
}

function delete_row(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("formTable").deleteRow(i);
}
