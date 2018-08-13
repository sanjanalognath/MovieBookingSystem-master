/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function selectedMovie(movieid) {
        
    document.getElementById("hidmovieid").value = movieid;
    var test=document.getElementById("hidmovieid").value;
    document.getElementById("displayMovieForm").submit();    

}

function selectseat(seatid) {
        
    var seatStatus=document.getElementById(seatid).checked;
    var seatValue=document.getElementById(seatid).value;
    var movieID=document.getElementById("hidmovieid").value;
    var screeningID=document.getElementById("hidscreeningid").value;
    var status;
    if(seatStatus){
        status=1;
    }
    else{
        status=0;
    }
    $.post("/MovieBookingSystem/UpdateSeatSelection",
        {
          movieID: movieID,
          screeningID: screeningID,
          seatValue: seatValue,
          status:status
        },
        function(data,status){
            //alert("Data: " + data + "\nStatus: " + status);
            if(data=="failed"){
                //var col=document.getElementById(seatid);
                //col.style.background="blue"
                document.getElementById(seatid).disabled=true;
                document.getElementById(seatid).className="seat-select-block";
                alert("Sorry, that seat has been already booked :(");
            }
            
        });

}

function form1Submit() {
        
    document.getElementById("UpdateMovieRev").submit();    

}

function form2Submit() {
    document.getElementById("DisplayMovieInfo").submit();    

}

function myFunction() {
    if(confirm("Do you want to confirm delete!") == true){
        return true;
    }
    else{
        return false;
    }
}

function myFunctionLogout() {
    if(confirm("Do you wish to confirm Logout!") == true){
        return true;
    }
    else{
        return false;
    }
}


	
     
