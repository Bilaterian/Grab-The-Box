local stagesPage = {}

local debugPrint = require "debugPrint"

local width, height
local canvas

--[[
    level = {
        -- possible additions
        - stars = 0 to 3
        - time = time taken to beat level
        
        -- data for game
        - player coord = {x, y}
        - box coord = {x, y}
        - isFinished = false
    }
]]

--needs a function to fill from file
local levels = { -- max 77 levels
    {
        playerCoord = {100, 100},
        boxCoord = {500, 500},
        isFinished = false,
    },
}

local stageButton = {
    width = 60,
    height = 60,
    xOffset = 45,
    yOffset = 55,
    isPressed = false,
}

function stagesPage.onLoad()
    width, height = love.window.getMode()
    canvas = love.graphics.newCanvas(width, height)
    --need data to pass towards level 
end

function stagesPage.drawMenu()
    local font, text, x, y
    local xOffset = stageButton.xOffset
    local yOffset = stageButton.yOffset
    love.graphics.setCanvas(canvas)
        for key, value in ipairs(levels) do
            love.graphics.setColor(love.math.colorFromBytes(164, 100, 34, 255))
            love.graphics.rectangle("fill", xOffset, yOffset,
                                            stageButton.width, stageButton.height)
            font = love.graphics.newFont(24)
            text = love.graphics.newText(font, key)
            x = ((stageButton.width - font:getWidth(key)) / 2) + xOffset
            y = ((stageButton.height - font:getHeight(key)) / 2) + yOffset
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.draw(text, x, y)

            xOffset = xOffset + stageButton.width + 5

            if xOffset + stageButton.width > width then
                xOffset = stageButton.xOffset
                yOffset = yOffset + stageButton.height + 5
                if yOffset + stageButton.height > height then
                    yOffset = stageButton.yOffset
                end
            end
        end
    love.graphics.setCanvas()
end

function stagesPage.getMenu()
    --debugPrint.setText("canvas")
    return canvas
end

function stagesPage.checkBounds(x, y)
    local xOffset = stageButton.xOffset
    local yOffset = stageButton.yOffset
    for key, value in ipairs(levels) do
        if x > xOffset and x < xOffset + stageButton.width then
            if y > yOffset and y < yOffset + stageButton.height then
                return key
            end
        end

        xOffset = xOffset + stageButton.width + 5

        if xOffset + stageButton.width > width then
            xOffset = stageButton.xOffset
            yOffset = yOffset + stageButton.height + 5
            if yOffset + stageButton.height > height then
                yOffset = stageButton.yOffset
            end
        end
    end
    return -1
end

function stagesPage.getLevelFromIndex(index)
    return levels[index]
end

return stagesPage