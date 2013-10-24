jQuery(document).ready ($) ->
  # Initially set opacity on thumbs and add
  # additional styling for hover effect on thumbs
  onMouseOutOpacity = 0.67
  $("#thumbs ul.thumbs li").opacityrollover
    mouseOutOpacity: onMouseOutOpacity
    mouseOverOpacity: 1.0
    fadeSpeed: "fast"
    exemptionSelector: ".selected"


  # Initialize Advanced Galleriffic Gallery
  gallery = $("#thumbs").galleriffic(
    delay: 3000
    numThumbs: 9
    preloadAhead: 9
    enableTopPager: false
    enableBottomPager: true
    maxPagesToShow: 3
    imageContainerSel: "#slideshow"
    captionContainerSel: '#caption'
    renderSSControls: false
    renderNavControls: false
    enableHistory: false
    autoStart: false
    syncTransitions: false
    defaultTransitionDuration: 900
    onSlideChange: (prevIndex, nextIndex) ->

      # 'this' refers to the gallery, which is an extension of $('#thumbs')
      @find("ul.thumbs").children().eq(prevIndex).fadeTo("fast", onMouseOutOpacity).end().eq(nextIndex).fadeTo "fast", 1.0

    onPageTransitionOut: (callback) ->
      @fadeTo "fast", 0.0, callback

    onPageTransitionIn: ->
      @fadeTo "fast", 1.0
  )