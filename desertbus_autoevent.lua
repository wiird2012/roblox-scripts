_G.jedalfarm = true --Switch to false if you want to stop the script

--[[
HOW TO USE:
Load in to Desert Bus, execute the script.
It should start working as long you get near the gift boxes
Idling near the 5 gifts in the second floor should get you the most

You need a total of 640 Jedals to complete the event)
Just to be safe use in a private server!!

Made with love, by Lilith // wiird2012
]]

while _G.jedalfarm == true do
    task.wait(.5) --Increase the delay if this lags for you
        for i,v in pairs(workspace.Decorations.Jedals.Gifts["Script"]:GetChildren()) do
            if v.Name == "Base" then
            fireclickdetector(v.Click.ClickDetector)
        end
    end
end
