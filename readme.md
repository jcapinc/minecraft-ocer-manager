# Minecraft Open Computers - Extreme Reactors
## Reactor control system
### Scenario

Lets say you have yourself a nice extreme reactor that pumps out energy, but you also have a bunch of little generaters from thermal expansion or some other place. Lets say that those little generators are using up resources that you dont want to hang around, so you want them pumping out energy all the time.

You want there to be little enough energy in the system that the generators are always running, but enough energy in the system that all machines will constantly have energy to run at their fullest capacity.

These two scripts manage this by accepting a redstone signal out of one of your small generators, and emitting a redstone signal to the reactor to enter "high energy" or "low energy" output modes to give the system time to use up excess energy left in the system.