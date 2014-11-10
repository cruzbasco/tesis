$(document).ready(function(){

	$('#float_modal').on('shown.bs.modal', function () {
	    $('#label').focus();
	});
	
	$("#new_field").click(function () {
		$(".modal-header").html("<center><h2>"+$("#new_field").text()+"</h2></center>");
	});

	function add_custom_attribute () {
		var label = $("#label").val().toLowerCase();
		var type = $("#type option:selected").val();
		$("div.body").append("<div class='form-group'><label class='control-label col-sm-2' for='"+label+"'>"+label+"</label><div class='col-md-8'><input id='"+label+"' name='"+label+"' type='"+type+"' class='form-control input-md'></div></div><input type='hidden' name='"+label+"_type' value='"+type+"'>"); 
	}

	$("#save").click(function(){
		if ($("#label").val() != "") {
			add_custom_attribute();	
			$("#float_modal").modal('hide');
		}
		$('#menu_flotante')[0].reset();
	});

});
