$(document).ready(function(){
  var windowWidth = $(window).width()

  // vertically align causes images on home
  var verticalCenter = function(images) {
    var divHeight = $('div.cause').outerHeight()
    var images = $('.small-cause-img')

    _.each(images,function(image) {
      console.log('f')
      var imageHeight = $(image).height()
      var margin =  Math.ceil((divHeight - imageHeight) / 2) - 10
      $(image).css('margin-top',margin.toString() + 'px')
    })
  }

  var initialHeight = $('div.cause').outerHeight()
  var images = $('.small-cause-img')
  verticalCenter(images)

  $(window).resize(function() {
    verticalCenter(images)
  })
})
