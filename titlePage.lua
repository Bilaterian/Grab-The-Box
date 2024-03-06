local titlePage = {}

local debugPrint = require "debugPrint"

local width, height
local canvas

local startButton = {
    width = 255,
    height = 100,
    xOffset = 55,
    yOffset = 300,
    text = "START",
    isPressed = false,
}

function titlePage.onLoad()
    width, height = love.window.getMode()
    canvas = love.graphics.newCanvas(width, height)
end

function titlePage.drawMenu()
    love.graphics.setCanvas(canvas)
        love.graphics.setColor(love.math.colorFromBytes(157, 157, 157, 255))
        love.graphics.rectangle("fill", startButton.xOffset, startButton.yOffset,
                                        startButton.width, startButton.height)
        local font = love.graphics.newFont(24)
        local text = love.graphics.newText(font, startButton.text)
        local x = ((startButton.width - font:getWidth(startButton.text)) / 2) + startButton.xOffset
        local y = ((startButton.height - font:getHeight(startButton.text)) / 2) + startButton.yOffset
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.draw(text, x, y)
    love.graphics.setCanvas()
end

function titlePage.getMenu()
    --debugPrint.setText("canvas")
    return canvas
end

function titlePage.checkBounds(x, y)
    if x > startButton.xOffset and x < startButton.xOffset + startButton.width then
        if y > startButton.yOffset and y < startButton.yOffset + startButton.height then
            return true
        end
    end
    return false
end

return titlePage