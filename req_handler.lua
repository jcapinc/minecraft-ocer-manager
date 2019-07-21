local computer = require("computer")
local component = require("component")
local sides = require("sides")
local term = require("term")
local event = require("event")
local os = require("os")

local configuredSide = sides.back
local type
local value
local from
local port

component.modem.open(1)
while true do
  term.write(".")
  _, _, from, port, _, type = event.pull(10,"modem_message")
  print(from, port, type)
  if type == "request_energy" then
    term.write("!")
    value = component.redstone.getInput(configuredSide)    
    component.modem.send(from, port, value)
    computer.beep(value * 132 + 20)
    os.sleep(60)
  end
end