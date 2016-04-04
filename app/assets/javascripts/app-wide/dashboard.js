$(document).ready(function(){
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
        $("footer").toggleClass(function(){
            if ( !$( this ).hasClass( "toggled" ) ) {
                $(this).removeClass('toggled');
                return "non-toggled";
            } else {
                $(this).removeClass('non-toggled');
                return "toggled";
            }

        });
        $( "#menu-toggle i" ).toggleClass(function() {
            if ( $( this ).hasClass( "fa-angle-double-left" ) ) {
                $(this).removeClass('fa-angle-double-left');
                return "fa-angle-double-right";
            } else {
                $(this).removeClass('fa-angle-double-right');
                return "fa-angle-double-left";
            }
        });
    });
});
