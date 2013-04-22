/*var ajax_loaded = (function(response){
  $("#content").slideUp(500, function(){
      $("#content").html(response).slideDown(500);

      $("#content .ajax").on("click", ajax_load);
      $("#content form").on("submit", form_submit);
    });

 
});
var form_submit = (function(e){ //for the create post and update
  e.preventDefault();

  var url = $(this).attr("action");  //forms always have action and method in source code
  var method = $(this).attr("method");
   

  var data = {};
  $(this).find("input, textarea").each(function(i){
    var name = $(this).attr("name");
    var value = $(this).val();  

    data[name] = value;
  });

  $.ajax({
    "url": url,
    "type": method,
    "success": function(){$(history.slice(-2)[0]).trigger("click");}, //tell it where to go
    "error": function(){alert("BAD");},
    "data": data
  });
});


var history = [];
var current_url_method;
var ajax_load = (function(e){
  e.preventDefault();
  history.push(this);
  var url = $(this).attr("href");
  var method = $(this).attr("data-method");
  if(current_url_method != url){  //check to see if on current page
    current_url_method = url + method;
  
  //$.get(url, ajax_loaded); not needed cause of .ajax
    $.ajax({
       "type": method,
       "url": url,
       "success": ajax_loaded,
       "error": function(){
       $(history.slice(-2)[0]).trigger("click");
      }
   
  });
  }
});

$("#menu a").on("click", ajax_load);
$("#menu a.main").trigger("click");

//// 
$("#search").on("keyup", function(){

  var searchField = $("#search").val();
  var myExp = new RegExp(searchField,"i");
  $.getJSON('books.json', function(data){
    var output = '<ul class="searchresults">';
    
    $.each(data, function(key, value){
      if(value.title.search(myExp) != -1){
      output = output + "<li>" + "<h2>" + value.title + "</h2>" + "</li>";
    }
    });
    
    output = output + "</ul>";
    $("#footer").hide().html(output).fadeIn(400);
  });

}); */
//// autocomplete part be sure to add jquery ui script in index.html

  var output = [];
   var itemValue;
  $.getJSON('user_industries.json', function(data){
    $.each(data, function(key,value){
    
      if ($.inArray(this.industry_name,output) == -1){
        output.push(value.industry_name);
        itemValue = "<option value=" + value.industry_name + ">" + value.industry_name + "</option>";
        $("#selectMenu").append(itemValue);
      }
     });  
        $("select").multiselect({ 
           header: false,
           height: "auto",
           width: "auto"
        });
   });
$("#test").autocomplete({
  source: output
});


