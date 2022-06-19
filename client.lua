local maxdistance = 2

function texttohtml(msg)
    msg = msg:gsub("~r~", "<span style=color:red;>")
    msg = msg:gsub("~b~", "<span style='color:rgb(0, 213, 255);'>")
    msg = msg:gsub("~g~", "<span style='color:rgb(0, 255, 68);'>")
    msg = msg:gsub("~y~", "<span style=color:yellow;>")
    msg = msg:gsub("~p~", "<span style='color:rgb(220, 0, 255);'>")
    msg = msg:gsub("~f~", "<span style=color:grey;>")
    msg = msg:gsub("~m~", "<span style=color:darkgrey;>")
    msg = msg:gsub("~u~", "<span style=color:black;>")
    msg = msg:gsub("~o~", "<span style=color:gold;>")
    msg = msg:gsub("~s~", "</span>")
    msg = msg:gsub("~w~", "</span>")
    msg = msg:gsub("~b~", "<b>")
    msg = msg:gsub("~n~", "<br>")
    msg = msg:gsub("\n", "<br>")
    msg = msg:gsub("~input~", "<span class = 'INPUT_CONTEXT'>")
    msg = msg:gsub("~INPUT_CONTEXT~", "<span class = 'INPUT_CONTEXT'>E</span>")
    msg = msg:gsub("~INPUT_DETONATE~", "<span class = 'INPUT_CONTEXT'>G</span>")
    msg = msg:gsub("~INPUT_VEH_EXIT~", "<span class = 'INPUT_CONTEXT'>F</span>")
    msg = msg:gsub("~INPUT_RELOAD~", "<span class = 'INPUT_CONTEXT'>R</span>")
    msg = "<span style=color:currentColor>" .. msg .. "</span>"
    return msg
    
end

function toggletextui(type, msg)
    SendNUIMessage({
        type = type,
        msg = texttohtml(msg),
    })
end

CreateThread(function()
    while true do
    local _sleep = 1000
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    if #(plyCoords - vec3(213.296, -808.97, 30.99)) < 2 then
            _sleep = 0
            toggletextui(true, "~INPUT_CONTEXT~ Acceder al ~b~Garaje~w~")
            else
            toggletextui(false, "")
                _sleep = 1000
        end
        Wait(_sleep)
    end
end)