$(window).load ->
  $(".demo").customScrollbar()

$(window).load ->
  $(".demo2").customScrollbar()


CLASSIC_BELT_COLORS = ["2D2926", "AED8EE", "1D1F91", "453625", "D46710", "113E00", "44D62C", "53565A", "E31C79", "ECD898", "D2A3CA", "84BD00", "76232F", "13294B", "F3F315", "59621D", "FF8F1A", "FFA3B5", "67476A", "ED1F1E", "05C3DE", "2CD5C4", "FFFFFF", "FEE528", "ECD898", "000000", "E31C79", "000000", "F9FBF7"]
CLASSIC_BUCKLE_COLORS = ["2D2926", "84C4E5", "1D1F91", "5E311D", "CC5F24", "113E00", "97D700", "75777A", "E31C79", "EECC66", "D2A3CA", "84BD00", "CB333B", "13294B", "F3F315", "353b12", "FF8F1A", "FFA3B5", "67476A", "ED1F1E", "05C3DE", "2CD5C4", "FFFFFF", "FEE528", "EEF2F4", "8A8D8F", "7F6B00", "000000"]
SKINNY_BELT_COLORS = ["6EAED6", "2D2926", "E31C79", "A2A4A6", "00C954", "BBA47D", "7B2290", "FF0000", "0086BF", "FFB51C", "FFFFFF", "F6E730"]
SKINNY_BUCKLE_COLORS = ["6EAED6", "2D2926", "E31C79", "53565A", "00C954", "BBA47D", "7B2290", "FF0000", "009AFF", "F0B323", "FFFFFF", "F6E730"]
columns = Math.floor($('div.viewport').width() / 32)

#
$("#icolor").icolor
  flat: true
  colors: CLASSIC_BELT_COLORS
  col: columns
  onSelect: (c) ->
    @$tb.css "", c

  showInput: true
  title: false


#<![CDATA[
$("#icolor2").icolor
  flat: true
  colors: CLASSIC_BUCKLE_COLORS
  col: columns
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






$(".next2").click ->
  cycle_type("next")

$(".prev2").click ->
  cycle_type("prev")

cycle_type = (dir) ->
  update_type_index(dir)
  update_type_title(dir)
  update_belt_and_buckle_icolors()
  update_image_src()


type_index = 1
max = $("#type-titles li").length

update_type_index = (dir) ->
  if dir is "next"
    type_index++
    if type_index is (max + 1)
      type_index = 1
  else
    type_index--
    if type_index is 0
      type_index = max

update_type_title = (dir) ->
  current = type_index
  if dir is "next"
    previous = type_index - 1
    if previous is 0
      previous = max
  else
    previous = type_index + 1
    if previous is (max + 1)
      previous = 1
  hidden = $("#i-" + previous)
  active = $("#i-" + current)
  hidden.css "display", "none"
  active.css "display", "block"

update_belt_and_buckle_icolors = ->
  type = get_type()
  if type is "skinny"
    belt_colors = SKINNY_BELT_COLORS
    buckle_colors = SKINNY_BUCKLE_COLORS
  else if type is "classic"
    belt_colors = CLASSIC_BELT_COLORS
    buckle_colors = CLASSIC_BUCKLE_COLORS
  belt_html = redraw_icolor(belt_colors, "1")
  belt_chooser = $("#icolor_1")
  belt_chooser.html()
  belt_chooser.html(belt_html)
  buckle_html = redraw_icolor(buckle_colors, "2")
  buckle_chooser = $("#icolor_2")
  buckle_chooser.html()
  buckle_chooser.html(buckle_html)
  init_icolor_1()
  init_icolor_2()
  false

get_type = ->
  active = $("#i-" + type_index + " p:first-child")
  return active.html().trim().toLowerCase()

update_image_src = -> 
  type = get_type()
  set_belt_image(type, "0.png")
  set_buckle_image(type, "0.png")

set_belt_image = (type, png) ->
  $('.active-belt').attr("src","assets/belts/" + type + "/" + png)

set_buckle_image = (type, png) ->
  $('.active-buckle').attr("src","assets/buckles/" + type + "/" + png)


redraw_icolor = (colors, id) ->
  html = '<div class="icolor icolor_flat" id="icolor_' + id + '">'
  html += '<table class="icolor_ct">'
  for color, index in colors
    if (index % columns) is 0
      html += "<tr>"
    html += '<td style="background-color:#' + color + ';" abbr="' + color + '"></td>'
    if (index % columns) is (columns - 1)
      html += "</tr>"
  html += '</table>'
  html += '</div>'
  html


init_icolor_1 = ->
  set_icolor_click_listener("1")

init_icolor_2 = ->
  set_icolor_click_listener("2")

set_icolor_click_listener = (id) ->
  $("#icolor_" + id + " .icolor_ct td").click (event) ->
    td_index = $(this).index()
    tr_index = $(this).parent("tr").index()
    index = tr_index*columns + td_index
    type = get_type()
    if id is "1"
      set_belt_image(type, index+".png")
    else
      set_buckle_image(type, index+".png")


init_icolor_1()
init_icolor_2()
