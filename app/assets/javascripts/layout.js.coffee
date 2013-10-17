$(window).load ->
  $(".demo").customScrollbar()

$(window).load ->
  $(".demo2").customScrollbar()


#
$("#icolor").icolor
  flat: true
  colors: ["2D2926", "AED8EE", "1D1F91", "453625", "D46710", "113E00", "44D62C", "53565A", "E31C79", "ECD898", "D2A3CA", "84BD00", "76232F", "13294B", "F3F315", "59621D", "FF8F1A", "FFA3B5", "67476A", "ED1F1E", "05C3DE", "2CD5C4", "FFFFFF", "FEE528", "ECD898", "000000", "E31C79", "000000", "F9FBF7"]
  onSelect: (c) ->
    @$tb.css "", c

  showInput: true
  title: false


#<![CDATA[
$("#icolor2").icolor
  flat: true
  colors: ["2D2926", "84C4E5", "1D1F91", "5E311D", "CC5F24", "113E00", "97D700", "75777A", "E31C79", "EECC66", "D2A3CA", "84BD00", "CB333B", "13294B", "F3F315", "353b12", "FF8F1A", "FFA3B5", "67476A", "ED1F1E", "05C3DE", "2CD5C4", "FFFFFF", "FEE528", "EEF2F4", "8A8D8F", "7F6B00", "000000"]
  onSelect: (c) ->
    @$tb.css "", c

  showInput: true
  title: false

$("#icolor3").icolor
  flat: true
  colors: []
  onSelect: (c) ->
    @$tb.css "", c

  showInput: true
  title: false

window.beltClickCount = 0

rgbtohex = (rgb) ->
  hex = (x) ->
    ("0" + parseInt(x).toString(16)).slice -2
  rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/)
  "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3])

$("#icolor_1 .icolor_ct td").click (event) ->
  td_index = $(this).index()
  tr_index = $(this).parent("tr").index()
  belt_index = tr_index * 8 + td_index
  $('.active-belt').attr("src","assets/belts/classic/"+belt_index+".png") ;
  window.beltClickCount += 1
  window.recentBelt = rgbtohex $(this).css("background-color")
  recentSelection()

$("#icolor_2 .icolor_ct td").click (event) ->
  td_index = $(this).index()
  tr_index = $(this).parent("tr").index()
  buckle_index = tr_index * 8 + td_index
  $('.active-buckle').attr("src","assets/buckles/classic/"+buckle_index+".png") ;
  window.beltClickCount += 1
  window.recentBuckle = rgbtohex $(this).css("background-color")
  recentSelection()

recentSelection = ->
  if window.beltClickCount >= 2
    tile = $($('#icolor_3').children()[0]).append("<div style='width: 45px; height: 45px;'></div>").children().last()
    paper = Raphael(tile[0], 42,42)

    console.log(window.recentBuckle)
    paper.path('M 0 0 L 42 0 L 0 40 L 0 0').attr('fill', window.recentBuckle)
    console.log(window.recentBelt)
    paper.path('M 42 0 L 42 40 L 0 40').attr('fill', window.recentBelt)

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
    numThumbs: 9
    preloadAhead: 9
    enableTopPager: true
    enableBottomPager: false
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

$(document).ready ->

  prAligner = ->
    slideShowWidth = $(".showcase-content").width()
    $prItem = $(".news-icon")
    prWidth = $prItem.outerWidth(true) + $($prItem.siblings()[0]).width() + 32
    $(".news-bar").css "margin-left", (Math.ceil((slideShowWidth - prWidth + 30) / 2)) + "px"

  delayAligner = ->
    setTimeout(prAligner, 264)

  responsivePR = ->
    if $(window).width() < 600
      $("div.row-fluid.full").css "position", "relative"
      $("div.row-fluid.full").css "margin-top", $('div.caption').height() / 1.3

  delayAligner()
  setTimeout responsivePR, 300

  $(window).resize ->
    prAligner()
    responsivePR()

  $("#showcase").awShowcase
    content_height: 70
    fit_to_parent: false
    auto: true
    interval: 3000
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
  return if (ptr * step) is max
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
  return if ptr is 0
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
