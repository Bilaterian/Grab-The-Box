local states = {}

local gameState = {
    "TITLE",
    "STAGES",
    "GAME",
    "PAUSE",
}

local state = "TITLE"

function states.getState()
    return state
end

local function validateState(newState)
   for index, page in ipairs(gameState) do
        if newState == page then
            return true
        end
   end
   return false
end

function states.setState(newState)
    --check if state is valid
    if validateState(newState) == true then
        state = newState
    end
end

return states