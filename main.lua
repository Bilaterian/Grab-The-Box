local states = require "states"
local titlePage = require "titlePage"
local debugPrint = require "debugPrint"

function love.load()
    titlePage.onLoad()
    titlePage.drawMenu()
end

function love.mousepressed(x, y, button, istouch)
    if states.getState() == "TITLE" then
        if titlePage.checkBounds(x, y) == true then
            states.setState("STAGES")
        end
    end
end

function love.update(dt)

end

function love.draw()
    --debugPrint.print()
    love.graphics.setColor(1,1,1)
    if states.getState() == "TITLE" then
        love.graphics.draw(titlePage.getMenu(), 0, 0)
    end
end