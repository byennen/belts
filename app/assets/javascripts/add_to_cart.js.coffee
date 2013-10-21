$(document).ready ->
  $("#add-to-cart").click (e) ->
    e.preventDefault()
    belt_url = $('.active-belt').attr('src')
    buckle_url = $('.active-buckle').attr('src')
    $.ajax
      type: "POST",
      url: "/line_items",
      dataType: 'script',
      data: {belt_url: belt_url, buckle_url: buckle_url}

