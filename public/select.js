$(document).ready(function(){
  
  var contents;
 
	var drag_option = {
  	    cancel: false,
  		containment: 'document',
		cursor: 'pointer',
		revert: true,
		start: function(){
			contents = $(this).text();
		}
  	};
  
  
  $(".takers").droppable({
  	hoverClass: 'borderDiv', 
	accept: '#textLeaving, #textThird, .btn',
	drop: function(){
		$(this).append(contents + "<br />");
		$(this).dblclick(function(){
			$(this).empty();
		});
	}
  });
  $('button').button();

  function display(){
    var item = $('#selectedLeaving').val();
    var btn = $(".btn:first").clone()
    	.html(item)
    	.draggable(drag_option)
    	.on("dblclick", function(){ $(this).remove(); });
    	
    $("#textLeaving").append(btn);
  }
  
  $('#selectedLeaving').change(display);
  $('#selectedThird').change(display);
  display();
});

