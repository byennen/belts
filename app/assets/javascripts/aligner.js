$(document).ready(function(){
  var windowWidth = $(window).width()

  // vertically align causes images on home
  var verticalCenterHome = function(images) {
    console.log("init center home")
    var divHeight = $('div.cause').outerHeight()
    var images = $('.small-cause-img')

    _.each(images,function(image) {
      var imageHeight = $(image).height()
      var margin =  Math.ceil((divHeight - imageHeight) / 2) - 10
      $(image).css('margin-top',margin.toString() + 'px')
    })
  }



  // vertically center on causes show
  var verticalCenterShow = function() {
    console.log("init center show")
    var divHeight = $('div.cause.mod3').outerHeight()
    var images = $('.cause-img')

    _.each(images, function(image){
      var imageHeight = $(image).height()
      var header = $(image).siblings()
      var margin =  Math.ceil((divHeight - imageHeight - 51) / 2)
      $(image).css('margin-top',margin.toString() + 'px')
      $(header).css('margin-top', margin -($(header).height()) + 15 + 'px')
    })
  }

  var initImages = $('.small-cause-img')
  setTimeout(verticalCenterHome,300)
  setTimeout(verticalCenterShow,300)

  $(window).resize(function() {
    verticalCenterHome(initImages)
    verticalCenterShow()
  })
})
