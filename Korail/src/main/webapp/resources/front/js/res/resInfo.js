$( function() {
  
    $( "#datepicker" ).datepicker({
    	showOn: "button", 
      maxDate       : "+180D",
        buttonImage: "https://image.flaticon.com/icons/png/512/148/148982.png", 
        buttonImageOnly: true 
    });
    
  } );