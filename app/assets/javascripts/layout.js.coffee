$(window).load ->
  $(".demo").customScrollbar()

$(window).load ->
  $(".demo2").customScrollbar()


#
$("#icolor").icolor
  flat: true
  onSelect: (c) ->
    @$tb.css "", c

  showInput: true
  title: false


#<![CDATA[
$("#icolor2").icolor
  flat: true
  onSelect: (c) ->
    @$tb.css "", c

  showInput: true
  title: false

jQuery(document).ready ($) ->
  # We only want these styles applied when javascript is enabled
  $("div.navigation").css float: "right"
  $("div.content").css "display", "block"

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
    numThumbs: 12
    preloadAhead: 40
    enableTopPager: true
    enableBottomPager: false
    maxPagesToShow: 3
    imageContainerSel: "#slideshow"
    captionContainerSel: '#caption'
    renderSSControls: false
    renderNavControls: false
    enableHistory: false
    autoStart: false
    syncTransitions: true
    defaultTransitionDuration: 900
    onSlideChange: (prevIndex, nextIndex) ->

      # 'this' refers to the gallery, which is an extension of $('#thumbs')
      @find("ul.thumbs").children().eq(prevIndex).fadeTo("fast", onMouseOutOpacity).end().eq(nextIndex).fadeTo "fast", 1.0

    onPageTransitionOut: (callback) ->
      @fadeTo "fast", 0.0, callback

    onPageTransitionIn: ->
      @fadeTo "fast", 1.0
  )

$(document).ready ->

  prAligner = ->
    slideShowWidth = $(".showcase-content").width()
    $prItem = $(".news-icon")
    prWidth = $prItem.outerWidth(true) + $($prItem.siblings()[0]).width() + 32
    $(".news-bar").css "margin-left", (Math.ceil((slideShowWidth - prWidth + 30) / 2)) + "px"

  delayAligner = ->
    setTimeout(prAligner, 264)

  delayAligner()

  $("#showcase").awShowcase
    content_height: 70
    fit_to_parent: false
    auto: true
    interval: 2000
    continuous: false
    loading: true
    arrows: true
    buttons: true
    btn_numbers: true
    keybord_keys: true
    mousetrace: false # Trace x and y coordinates for the mouse
    pauseonover: true
    stoponclick: false
    transition: "hslide" # hslide/vslide/fade
    transition_delay: 0
    transition_speed: 250
    custom_function: delayAligner


$ ->
  $("select").uniform()

$(document).ready ->
  $("#nav").onePageNav
    begin: ->
      console.log "start"

    end: ->
      console.log "stop"


jQuery(document).ready ($) ->
  $("#full-width-slider").royalSlider
    arrowsNav: true
    loop: false
    keyboardNavEnabled: true
    controlsInside: false
    imageScaleMode: "fill"
    arrowsNavAutoHide: false
    autoScaleSlider: true
    autoScaleSliderWidth: 960
    autoScaleSliderHeight: 350
    controlNavigation: "bullets"
    thumbsFitInViewport: false
    navigateByClick: true
    startSlideId: 0
    autoPlay: false
    transitionType: "move"
    globalCaption: true

jQuery(document).ready ($) ->
  $(".div-top-bar").hcSticky
    followScroll: true
    onStart: ->
      $("#hdnIsStickyStart").val "Yes"
      $(".div-top-bar").css "top", "0px"
      $("div#row-2ndpage-content").css "margin-top", "0px"

    onStop: ->
      if not $(this).hasClass("sticky") and $("#hdnIsStickyStart").val() is "Yes"
        $("#hdnIsStickyStart").val "No"
        $(".div-top-bar").css "top", "-300px"


next = ->
  return  if (ptr * step) is max
  current = undefined
  current = (ptr * step) + 1
  if ptr > 0
    i = current
    j = current - 1

    while i < current + 1
      $("#i-" + i).css "display", "block"
      $("#i-" + j).css "display", "none"
      i++
      j--
  else
    i = current
    while i < current + 1
      $("#i-" + i).css "display", "block"
      i++
  ptr++
back = ->
  return  if ptr is 0
  current = ptr * step
  if ptr > 1
    i = current
    j = current - 1

    while i > current - 1
      $("#i-" + i).css "display", "none"
      $("#i-" + j).css "display", "block"
      i--
      j--
  else
    i = current
    while i > current - 1
      $("#i-" + i).css "display", "none"
      i--
  ptr--
ptr = 0
step = 1
max = 5
