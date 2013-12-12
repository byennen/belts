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
      $('#proceed_button').attr('disabled', true)
      $('#proceed_button').button('loading')      
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
      $('#stripe_error').hide()
      $('#order_stripe_card_token').val(response.id)
      $('#create_order')[0].submit()
    else      
      $('body,html').animate(scrollTop: $('#stripe_error').offset().top - 100 )
      $('#stripe_error').fadeIn()
      $('#stripe_error').text(response.error.message)
      $('#proceed_button').attr('disabled', false)
      $('#proceed_button').button('reset')

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