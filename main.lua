local states = require "states"
local titlePage = require "titlePage"
local stagesPage = require "stagesPage"
local debugPrint = require "debugPrint"

function love.load()
    titlePage.onLoad()
    titlePage.drawMenu()
    stagesPage.onLoad()
    stagesPage.drawMenu()
end

local pressAgain = true
function love.mousepressed(x, y, button, istouch)
    if states.getState() == "TITLE" and pressAgain == true then
        if titlePage.checkBounds(x, y) == true then
            states.setState("STAGES")
            pressAgain = false
        end
    end
    if states.getState() == "STAGES" and pressAgain == true then
        if stagesPage.checkBounds(x, y) ~= -1 then
            states.setState("GAME")
            --load level here
            pressAgain = false
        end
    end
end

--this was added to prevent clicking through multiple menus
function love.mousereleased( x, y, button, istouch, presses )
    pressAgain = true
end

function love.update(dt)

end

function love.draw()
    debugPrint.print()
    love.graphics.setColor(1,1,1)
    if states.getState() == "TITLE" then
        love.graphics.draw(titlePage.getMenu(), 0, 0)
    elseif states.getState() == "STAGES" then
        love.graphics.draw(stagesPage.getMenu(), 0, 0)
    end
end