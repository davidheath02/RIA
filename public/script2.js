var ajax_loaded =(function(response){
	$("#content").slideUp(
		500,
		function(){
			$("#content").html(response).slideDown(500);
			$("#content .ajax").on("click", ajax_load);
			$("#content form").on("submit", form_submit);
		});
	});


var form_submit = (function(e){
	e.preventDefault();
	var url = $(this).attr("action");
	var method = $(this).attr("method");
	
	var data = {};
	$(this).find("input, textarea").each(function(i){
		var name = $(this).attr("name");
		var value = $(this).val();
		
		data[name] = value;
	});
	
	$.ajax({
		"url":url,
		"data":data,
		"type": method,
		"success": function(){
		 $(history.slice(-2)[0]).trigger("click");	
		
	  },
		"error": function(){alert("Bad");}
		});
	
	
});

var history = [];	
var current_url_method;

var ajax_load= (function(e){
	e.preventDefault();
	history.push(this);
	var url = $(this).attr("href");
	var method = $(this).attr("data-method");
	if(current_url_method != url + method){
		current_url_method = url + method;
		$.ajax({
			"url": url,
			"success": ajax_loaded,
			"error": function(){
				$(history.slice(-2)[0]).trigger("click");
				},
			"type": method,
			 
		});
	}
	
 });
 


$("#menu a").on("click", ajax_load);
$("#menu a.main").trigger("click");


