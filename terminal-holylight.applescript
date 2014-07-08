
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

-- Holylight binary
property holylight : "/usr/local/opt/terminal-holylight/holylight-checker"

-- User settings
property plist : "/Library/LaunchAgents/no.take.terminal-holylight.plist"

-- Default settings
set defaults to {{key:"Threshold", val:"1000000"}, {key:"Throttle", val:"10"}, {key:"Light", val:"Light"}, {key:"Dark", val:"Dark"}}

-- Merged settings
global settings
set settings to retrieveSettings(plist, defaults)

-- Code executed every `throttle` number of seconds
on idle
  if application "Terminal" is running then
    -- Ambient light-sensor value
    set brightness to (do shell script holylight) as integer
    set threshold to getProperty(settings, "Threshold") as integer
    local profilename
    if brightness < threshold then
      set profilename to getProperty(settings, "Dark") as string
    else
      set profilename to getProperty(settings, "Light") as string
    end if
    changeTerminalProfile(profilename)
  end if
  return getProperty(settings, "Throttle") as integer
end idle

-- Set profile for all terminal windows and tabs within those windows
on changeTerminalProfile(profilename)
  tell application "Terminal"
    repeat with w from 1 to count windows
      repeat with t from 1 to count tabs of window w
        set current settings of tab t of window w to (first settings set whose name is profilename)
      end repeat
    end repeat
  end tell
end changeTerminalProfile

-- Retrieve user-preferences and merge with defaults
-- Return List
on retrieveSettings(plist, settings)
  set newSettings to {}
  tell application "System Events"
    tell property list file plist
      tell contents
        repeat with i from 1 to count settings
          local tempSetting
          set settingKey to (key of item i in settings)
          set settingValue to (val of item i in settings)
          try
            set tempSetting to {key:settingKey, val:(value of property list item settingKey)}
          on error errMsg
            set tempSetting to {key:settingKey, val:settingValue}
          end try
          copy tempSetting to end of newSettings
        end repeat
      end tell
    end tell
  end tell
  return newSettings
end retrieveSettings

-- Retrieve a property from a "hash-table"
-- Return String
on getProperty(settingsList, attr)
  repeat with i from 1 to count settingsList
    if attr is equal to key of (item i in settingsList) then
      return val of (item i in settingsList)
    end if
  end repeat
end getProperty

