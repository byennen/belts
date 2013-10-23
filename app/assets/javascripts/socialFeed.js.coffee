$(document).ready ->

  convertUnixTime = (unix)->
    return $.timeago(Date.parse(unix))

  twitterFetcher.fetch('392675792536096768', 'tweets', 5, true, true, true, convertUnixTime, true, undefined, false);


  truncate = (string) ->
    if string.length > 30
      string.substring(0,30) + '...'
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

  $.ajax
    type: "get",
    url: "/social-feed"
  .done (apiData) ->
    _.each apiData.facebook.feed.data, (post) ->
      return true unless post.picture
      post.truncateLink = truncate(post.link)
      $("ul.posts.chn.facebook").append(_.template(facebookTemplate, post))

  # var compiled = _.template("hello: <%= name %>");
  # compiled({name: 'moe'});
  # => "hello: moe"

  # var list = "<% _.each(people, function(name) { %> <li><%= name %></li> <% }); %>";
  # _.template(list, {people: ['moe', 'curly', 'larry']});
  # => "<li>moe</li><li>curly</li><li>larry</li>"

  # var template = _.template("<b><%- value %></b>");
  # template({value: '<script>'});
  # => "<b>&lt;script&gt;</b>"
