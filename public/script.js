$(document).ready(function(){

	$("#ejemplo1").click(function () {
		$(".modal-header").html("<center><h2>"+$("#ejemplo1").text()+"</h2></center>");
	});

	function formulario1 () {

		var label = $("#label").val();
		var type = $("#type option:selected").val();

		if (type == "text" || type == "number"|| type == "date") {
			$("div.body").append("<!--"+type+" input--> <br><div class='form-group'><label class='control-label col-sm-2' for='"+label.toLowerCase()+"'>"+label+"</label><div class='col-md-8'><input id='"+label.toLowerCase()+"' name='"+label.toLowerCase()+"' type='"+type+"'class='form-control input-md'></div></div>"); // Se aniade el campo
		} else{
			alert("tipo no encontrado");
		};
	}

	$("#save").click(function(){
		if ($("#label").val() != "") {
			formulario1();	
		} else{
			alert("Llenar el campo");
		};
	});

	$("#saveOne").click(function(){
		if ($("#label").val() != "") {
			formulario1();	
		} else{
			alert("Llenar el campo");
		};
		$('#form1')[0].reset();
	});

});
