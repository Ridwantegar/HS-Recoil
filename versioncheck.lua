local resourceName = GetCurrentResourceName()
local currentVersion = GetResourceMetadata(resourceName, "version", 0)

local githubUser = "Ridwantegar"
local githubRepo = "HS-Recoil"
local branch = "master"
local versionFile = "version.txt"

local url = ("https://raw.githubusercontent.com/%s/%s/%s/%s")
    :format(githubUser, githubRepo, branch, versionFile)

PerformHttpRequest(url, function(err, latestVersion, headers)
    if err ~= 200 then
        print("^1[" .. resourceName .. "] Version check failed! HTTP: "..err.."^0")
        return
    end

    latestVersion = latestVersion:gsub("%s+", "")

    if latestVersion ~= currentVersion then
        print("^3====================================================^0")
        print("^1[" .. resourceName .. "] OUTDATED VERSION DETECTED!^0")
        print("^5Current Version: ^7" .. currentVersion)
        print("^2Latest Version: ^7" .. latestVersion)
        print("^3Please update your resource!^0")
        print("^3====================================================^0")
    else
        print("^2[" .. resourceName .. "] You are using the latest version (" .. currentVersion .. ")^0")
    end
end)