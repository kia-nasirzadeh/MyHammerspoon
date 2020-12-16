hs.hotkey.bind({"alt"}, "I", function()
  hs.eventtap.keyStroke({}, "up")
end)
hs.hotkey.bind({"alt"}, "K", function()
  hs.eventtap.keyStroke({}, "down")
end)
hs.hotkey.bind({"alt"}, "J", function()
  hs.eventtap.keyStroke({}, "left")
end)
hs.hotkey.bind({"alt"}, "L", function()
  hs.eventtap.keyStroke({}, "right")
end)

hs.hotkey.bind({"cmd", "shift"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"alt"}, "B", function()
  hs.alert.show(hs.battery.percentage())
end)

function sayBatteryFull ()
	local batteryPercentage
	batteryPercentage = hs.battery.percentage()
	if(batteryPercentage >= 100)
	then
		hs.notify.new({title="kia Battery plugin", informativeText="battery is full", withdrawAfter=5000, soundName="Glass"}):send()
	elseif (batteryPercentage <= 15)
	then
		hs.notify.new({title="kia Battery plugin", informativeText="plug in battery", withdrawAfter=5000, soundName="Glass"}):send()
	end
end

hs.battery.watcher.new(sayBatteryFull):start()
