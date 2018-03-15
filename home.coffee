commands =
  volume: "osascript -e 'output volume of (get volume settings)'"
  ismuted: "osascript -e 'output muted of (get volume settings)'"
  battery: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"
  ischarging: "sh ./home.widget/scripts/ischarging.sh"
  wifi: "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | sed -e \"s/^ *SSID: //p\" -e d"
  time: "date +\"%H:%M\""
  date: "date +\"%a %d %b\""
  playing: "osascript -e 'tell application \"Spotify\" to if player state is playing then artist of current track & \" - \" & name of current track'"
  desktop: "osascript -e 'tell application \"Finder\" to get posix path of (get desktop picture as alias)'"

command: "echo " +
         "$(#{ commands.volume }):::" +
         "$(#{ commands.ismuted }):::" +
         "$(#{ commands.battery }):::" +
         "$(#{ commands.ischarging }):::" +
         "$(#{ commands.wifi }):::" +
         "$(#{ commands.time }):::" +
         "$(#{ commands.date }):::" +
         "$(#{ commands.playing }):::" +
         "$(#{ commands.desktop }):::"

refreshFrequency: "1 s"

render: (output) ->
  """
  <div class="wrapper">

    <div class="block focus block-1x1 power">
      <p>pwr</p>
    </div>

    <div class="block block-1x1 wifi">
      <p>wifi</p>
    </div>

    <div class="block block-1x1 battery">
      <p></p>
    </div>

    <div class="block block-1x1 volume">
      <p>volume</p>
    </div>

    <div class="block block-1x2 time">
      <p></p>
    </div>

    <div class="block block-1x2 theme">
      <p></p>
    </div>

    <div class="block-1x4 music">
      <p></p>
    </div>

  </div>
  """

update: (output, domEl) ->
  output = output.split( /:::/g )

  values = []

  values.volume = output[ 0 ]
  values.ismuted = output[ 1 ]
  values.battery = output[ 2 ]
  values.ischarging = output[ 3 ]
  values.wifi = output[ 4 ]
  values.time = output[ 5 ]
  values.date = output[ 6 ]
  values.playing = output[ 7 ]
  values.desktop = output[ 8 ]

  if values.desktop.includes "green"
    @handleGreen(domEl)
  else if values.desktop.includes "red"
    @handleRed(domEl)
  else if values.desktop.includes "pink"
    @handlePink(domEl)

  @handleVolume(values.volume, values.ismuted, domEl)
  @handleBattery(values.battery, values.ischarging, domEl)
  @handleWifi(values.wifi, domEl)
  @handleTime(values.time, values.date, domEl)
  @handleMusic(values.playing, domEl)


# --
# -- Handle the block information
# --

handleVolume: (vol, muted, domEl) ->
  if(vol >= 31)
    $(".volume p").text("♭")
  else
    $(".volume p").text("♯")

handleBattery: (percent, charging, domEl) ->
  if charging == "true"
    $(".battery p").text("#{ percent } ✔")
  else
    $(".battery p").text("#{ percent } ✖")

handleWifi: (wifi, domEl) ->
  if wifi
    $(".wifi p").text("⋰")
  else
    $(".wifi p").text("⊗")

handleTime: (time, date, domEl) ->
  $(".time p").text("#{ date } #{ time}")

handleMusic: (song, domEl) ->
  if(!song || song == "")
    $(".music").css("display", "none")
  else
    $(".music").css("display", "flex")
    $(".music p").text("#{ song }")

# --
# -- Handle theme switching
# -- This works by overloading CSS variables
# -- based on the name of the desktop image
# --

handleGreen: (domEl) ->
  $(".wrapper").removeClass("red")
  $(".wrapper").removeClass("pink")
  $(".wrapper").addClass("green")
  $(".theme").text("Lily")

handleRed: (domEl) ->
  $(".wrapper").removeClass("green")
  $(".wrapper").removeClass("pink")
  $(".wrapper").addClass("red")
  $(".theme").text("Rose")

handlePink: (domEl) ->
  $(".wrapper").removeClass("green")
  $(".wrapper").removeClass("red")
  $(".wrapper").addClass("pink")
  $(".theme").text("Soft")


# --
# -- Interactivity with power button
# --

afterRender: (domEl) ->
  $(domEl).on 'click', '.power', =>
    @run "pmset sleepnow"

# --
# -- Import stylesheet
# --

style:
  """
    @import url(home.widget/styles/base.css);
  """
