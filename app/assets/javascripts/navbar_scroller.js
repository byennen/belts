$(document).ready(function(){
  // sticky navbar code
  $('div.main-navbar-fixed').hcSticky({
      wrapperClassName: 'wrapper-sticky',
      responsive: true,
      onStart: function() {
        $('div.main-navbar-fixed').show()
      },
      onStop: function() {
        // $('div.main-navbar-fixed').hide()
      }
  });

  // about us page images

  marqueeInit({
    uniqueid: 'crawler',
    style: {
      'padding': '2px',
      'width': '100%',
      'height': '400px'
    },
    inc: 7, //speed - pixel increment for each iteration of this marquee's movement
    mouse: 'cursor driven', //mouseover behavior ('pause' 'cursor driven' or false)
    moveatleast: 2,
    neutral: 150,
    savedirection: true,
    random: true,
    noAddedSpace: true,
  });

})
