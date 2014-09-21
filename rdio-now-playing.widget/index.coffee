command: """
IFS='|' read -r theName theArtist <<<"$(osascript 2>/dev/null <<<'
    if application "Rdio" is running then
        tell application "Rdio"
            if player state is playing then
                set theTrack to current track
                set theName to name of theTrack
                set theArtist to artist of theTrack
                return theName & "|" & theArtist
            end if
        end tell
    end if
')"
echo "$theName — $theArtist"
"""

refreshFrequency: 1000

style: """
  bottom: 10px
  left: 10px

  .rdio
    font-family: Helvetica Neue
    font-size: 30px
    font-weight: 100
    color: #fff
    text-shadow: 0 1px 5px #000;
"""

render: (output) ->
    output = '' if output.trim().length <= 1
    """<div class="rdio">#{output}</div>"""
