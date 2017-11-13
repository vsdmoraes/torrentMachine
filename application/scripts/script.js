$(document).ready(function(){
    $(".tooltip").on("click", function(){
        if($(".modal").hasClass("hidden")){
            $(".tooltip").addClass("close");
            $(".modal").removeClass("hidden");
            $(".modal-content").removeClass("hidden");
            $(".tooltip").removeClass("bg-green");
            $(".tooltip").addClass("bg-red");
            
        } else {
            $(".tooltip").removeClass("close");
            $(".modal").addClass("hidden");
            $(".modal-content").addClass("hidden");
            $(".tooltip").addClass("bg-green");
            $(".tooltip").removeClass("bg-red");
        }
    });
});