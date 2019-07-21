local comp = require("component")
local event = require("event")
local term = require("term")
local os = require("os")
local sides = require("sides")
local computer = require("computer")

function getReading()
  comp.modem.open(1)
  comp.modem.broadcast(1,"request_energy")
  _,_,_,_,_,response =event.pull(1,"modem_message")
  comp.modem.close(1)
  return response
end

function setOutput(level)
  local i = 0
  comp.redstone.setOutput(sides.back,level)
  return
end

function main()
  local reactorLevel = 5
  local reading
  os.sleep(1)
  term.clear()
  while true do
    reading = getReading()
    reactorLevel = resolveReactorLevel(reading, reactorLevel)
    print(reading, reactorLevel)
    setOutput(math.max(reactorLevel - 5, 0))
    os.sleep(60)
  end
end

function resolveReactorLevel(input,reactorLevel)
  if input == nil then
    return reactorLevel
  end
  computer.beep(input * 132 + 20)
  if input < 1 then
    reactorLevel = reactorLevel + 1
    term.write("+")
  else
    reactorLevel = reactorLevel - input
    term.write("-")
  end
  reactorLevel = math.min(reactorLevel,10)
  reactorLevel = math.max(reactorLevel,0)
  return reactorLevel
end 

main()