command: "osascript -e 'tell application \"Spotify\" to if player state is playing then artist of current track & \" - \" & name of current track'"

refreshFrequency: "10 s"

render: (output) ->
  """
  <div class="themeable block-1x4 music">
    <p></p>
  </div>
  """

update: (output, domEl) ->
  @handleMusic(output, domEl)

handleMusic: (song, domEl) ->
  if(!song || song == "")
    $(".music").css("display", "none")
  else
    $(".music").css("display", "flex")
    $(".music p").text("#{ song }")
