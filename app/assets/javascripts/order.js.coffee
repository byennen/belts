jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  order.setupForm()

  # coupon code application
  $('#apply_coupon').click (e)->
    e.preventDefault()
    order.apply_coupon($('#order_coupon_code').val())

  $('#order_coupon_code').keyup (e)->
    if e.which == 13
      e.preventDefault()
      order.apply_coupon($('#order_coupon_code').val())

order =
  setupForm: ->
    $('#create_order').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        order.processCard()
        false
      else
        true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#order_stripe_card_token').val(response.id)
      $('#create_order')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)

  apply_coupon: (code) ->
    $('#apply_coupon').button('loading')
    $.getJSON('/check-coupon', code: code, total: $('#apply_coupon').data('total'), (response, status)->
      $('#apply_coupon').button('reset')
      if status == 'success'
        if response.cents == 0
          alert "Sorry, the coupon code is invalid."
        else
          alert "Discount of $ #{response.discount} will be applicable."
          $('#total_price').html "TOTAL: $ #{response.total}"
          $('#coupon_discount').html "COUPON: $ #{response.discount}"
    )