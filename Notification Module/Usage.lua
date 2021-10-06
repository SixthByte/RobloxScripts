-- Load the script
local Notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/WolfGod746/RobloxScripts/main/Notification%20Module/Module.lua",true))()

-- Regular Notification
Notif("1", "2", 3, 4)

1 = <string> Title -- Top Notification text
2 = <string> Body -- Main Notification text
3 = <int> Duration -- How long the Notification is visible :: (Is overruled if 7 is true)
4 = <int> Image ID -- Custom Image ID :: (Image ID for custom image, 0 for no image, nil for default image)

--------------

-- Notification With Buttons
Notif("1", "2", 3, 4, "5", "6", 7, function()
    8
end)

1 = <string> Title -- Top Notification text
2 = <string> Body -- Main Notification text
3 = <int> Duration -- How long the Notification is visible :: (Is overruled if 7 is true)
4 = <int> Image ID -- Custom Image ID :: (Image ID for custom image, 0 for no image, nil for default image)
5 = <string> Primary Button -- Text for first button
6 = <string> Secondary Button -- Text for second button :: (Optional, set to nil for no secondary button)
7 = <boolean> Keep Open -- Stay open until user selects a button, will overrule 3 :: (true/false)
8 = <boolean> Script -- Script thats runs if user clicks the primary button
