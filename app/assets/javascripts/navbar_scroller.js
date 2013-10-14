// $(document).ready(function(){
//   // Add Scroller Object
//    $jScroller.add("#scroller_container","#scroller","left",5);

//    // Start Autoscroller
//    $jScroller.start();
//  })

$(document).ready(function(){

  if(window.location.pathname == '/') {
    $('div.main-navbar-fixed').hide()

    $('div.main-navbar-fixed').hcSticky({
        wrapperClassName: 'wrapper-sticky',
        responsive: true,
        onStart: function() {
          $('div.main-navbar-fixed').show()
        },
        onStop: function() {
          $('div.main-navbar-fixed').hide()
        }
    });
  }

})
