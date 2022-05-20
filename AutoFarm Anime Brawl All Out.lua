print("Autofarm Loaded!")

    --Auto-World

    _G.AutoWorld = true

    while _G.AutoWorld == true do
        wait(3)
        local place = game.PlaceId
        if place == 6310438798 then
            local args = {
                [1] = 5, -- Which World.
                [2] = 1, -- Which Map "inf" For Infinite Mode.
                [3] = "Hard" -- Easy, Normal, Hard or Extreme
            }
            
            game:GetService("ReplicatedStorage").RemoteFunctions.JoinWorld:InvokeServer(unpack(args))
        end
    end

--Repeat For Ultimate And Replay

repeat

    --Auto-Ultimate
    
    for i,v in pairs(game:GetService("Workspace"):WaitForChild("Team1").Units:GetChildren())do
        if v:FindFirstChild("Stats") then
            if v.Stats.UltimatePoints.Value >= v.Stats.UltimateMax.Value and v.Stats.UltRequest.Value == false and (not v.Stats:FindFirstChild("UseUlt") or v.Stats.UseUlt.Value == false) then
                local PF2BGoat = v.Stats.PositionPlate.Value.Name
                local Event = game:GetService("ReplicatedStorage").RemoteEvents.UltRequestFromClient
                Event:FireServer(PF2BGoat)
                print("Ultimate Activated!")
            end
        end
    end
    
    --Auto-Replay
    
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("OutroFrame") and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.OutroFrame.Visible == true then
        game:GetService("ReplicatedStorage").RemoteFunctions.ReplayWorld:InvokeServer()
        print("Replayed World!")
    end
        wait()
    until false 
    
    

