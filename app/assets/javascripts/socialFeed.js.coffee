$(document).ready ->

  convertUnixTime = (unix)->
    return $.timeago(Date.parse(unix))

  fetchTwitterFeed = ->
    twitterFetcher.fetch('392675792536096768', 'tweets', 6, true, true, true, convertUnixTime, true, undefined, false);
    $('.twitter-loading').hide()

  truncate = (string, maxLength) ->
    if string.length > maxLength
      string.substring(0, maxLength) + '...'
    else
      string

  facebookTemplate = """
    <li>
      <a class='thum' href='javascript:void(0);'>
        <img alt="Image" class='facebook-feed' src= <%= picture %> >
      </a>
      <p><%= message %></p>
      <p>
        <a href= <%= link %> ><%= truncateLink %></a>
      </p>
    </li>
    """

  instagramTemplate = """
    <li>
      <a class="thum" href=<%= link %> target="_blank">
        <img alt="Image" class="insta-feed" src= <%= images.thumbnail.url %> >
      </a>
      <p><%= truncateCaption %></p>
    </li>
    """

  populateFacebook = (apiData) ->
    postCount = 0
    _.each apiData.feed.data, (post) ->
      return true unless post.picture
      return true unless post.message
      return true if postCount > 3

      postCount++
      post.truncateLink = truncate(post.link, 50)
      $("ul.posts.chn.facebook").append(_.template(facebookTemplate, post))
    $('.fb-loading').hide()

  populateInstagram = (apiData) ->
    instaCount = 0
    _.each apiData, (post) ->
      return true if instaCount is 2
      return true unless post.caption.text

      post.truncateCaption = truncate(post.caption.text, 70)
      $("ul.posts.chan.instagram").append(_.template(instagramTemplate, post))
      instaCount++
    $('.insta-loading').hide()

  if window.location.pathname is '/'
    fetchTwitterFeed()

    $.ajax
      type: "get",
      url: "/social-feed"
    .done (apiData) ->
      populateFacebook(apiData.facebook)
      populateInstagram(apiData.instagram.data)
      $('.timePosted').hide()
