
(*
  Terminal holylight

  An AppleScript to change terminal-profile depending
  on your Macbook's ambient light sensor.

  Author:
  Henrik Kjelsberg <hkjels@me.com> (http://vim.guru/)

  Credit:
  Samy Dindane <samy@dindane.com> (http://dinduks.com/)

  License:
  MIT
*)

local threshold, holylight, holydark

-- User-specified preferences
set plist to "/Library/LaunchAgents/no.take.terminal-holylight.plist"
tell application "System Events"
  tell property list file plist
    tell contents
        set threshold to value of property list item "Threshold"
        set holylight to value of property list item "Holylight"
        set holydark to value of property list item "Holydark"
    end tell
  end tell
end tell

-- Default preferences
if threshold is missing value then
  set threshold to 1000000
end if
if holylight is missing value then
  set holylight to "Light"
end if
if holydark is missing value then
  set holydark to "Dark"
end if

-- Ambient light-sensor value
set brightness to (do shell script "/usr/local/bin/holylight-checker")

-- Set profile for all windows and tabs of those windows
tell application "Terminal"
  repeat with w from 1 to count windows
    repeat with t from 1 to count tabs of window w
      if brightness < threshold then
        set current settings of tab t of window w to (first settings set whose name is holydark)
      else
        set current settings of tab t of window w to (first settings set whose name is holylight)
      end if
    end repeat
  end repeat
end tell

