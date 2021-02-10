local wf=hs.window.filter

function focusTab(tabName)
  hs.application.enableSpotlightForNameSearches(true)

  --local app = hs.appfinder.appFromName(tabName)
  local app = hs.appfinder.appFromWindowTitlePattern(tabName)

  if app == nil then
     hs.application.launchOrFocus(tabName)
  else
     local windows = app:allWindows()

     for i = 1, #windows do
       print(windows[i]:title())
       if windows[i]:title():find(tabName) then
         windows[i]:focus()
         windows[i]:raise()
         break
       end
     end
  end
end

hs.hotkey.bind({"alt"}, "l", function()
  hs.eventtap.keyStrokes('console.log()')
end)


hs.hotkey.bind({"alt"}, "c", function()
  focusTab("Google Chrome")
end)

hs.hotkey.bind({"alt"}, "z", function()
  focusTab("iTerm")
end)

hs.hotkey.bind({"alt"}, "1", function()
  focusTab("Emacs")
end)


hs.hotkey.bind({"alt"}, "2", function()
  focusTab("IntelliJ IDEA")
end)
