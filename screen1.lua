module(..., package.seeall)

-- SCENE: SCREEN 1

--[[
 - Made by Robert Persaud @ 2011
 - Web: http://gamengineers.com/
 - Mail: robert.persaud@gmail.com
--]]

new = function ( params )
	
	-- Groups
	local localGroup = display.newGroup()
		
	-- Display Objects
	local background = display.newImage( "bg1.jpg" )
	localGroup:insert(background)
	
	-- Create static ground to impact falling objects
	local floor = display.newRect( 0, 602, 960, 1)
	localGroup:insert(floor)
	floor:setReferencePoint(display.CenterReferencePoint)
	floor.isVisible = false
	--floor.isHitTestable = true
	physics.addBody(floor, "static", {friction=0.5})
	
	local targets = {}
	for i = 1, 5 do
        targets[i] = display.newImage("penguin.png", math.random(960), 550)
        localGroup:insert(targets[i])
        physics.addBody(targets[i], { density=0.2, friction=0.1, bounce=0.5})
	end
		
	-- Apply force to any objects that come into contact w/ touch radius
	local function onLocalCollision (self, event)
	   if (event.phase == "began" and self.myName == "circle") then
	       local forcex = event.other.x-self.x
	       local forcey = event.other.y-self.y-20
	       if (forcex < 0) then
	           forcex = 0 - (180 + forcex) - 12
	       else
	           forcex = 180 - forcex + 12
	       end
	       event.other:applyForce(forcex, forcey, self.x, self.y)
	   end
	end
	
	local circle = ""
	local function setBomb (event)
	   if (event.phase == "began") then
	       circle = display.newCircle(event.x, event.y, 20)
	       localGroup:insert(circle)
	       circle.myName = "circle"
	       circle:setFillColor(255,255,255,100)
	       physics.addBody(circle, {isSensor = true})
	       circle.collision = onLocalCollision
	       circle:addEventListener("collision", circle)
	    end
        if (event.phase =="ended") then
            circle:removeSelf()
            localGroup:remove(circle)
        end
	end
	background:addEventListener("touch", setBomb)
	
	-- Add objects to display
	--localGroup:insert(background)
	--localGroup:insert(floor)	
	
	--[[
	local title      = display.newText( "Director Class", 0, 0, native.systemFontBold, 16 )
	local createdBy  = display.newText( "Created by Ricardo Rauber", 0, 0, native.systemFontBold, 16 )
	local website    = display.newText( "http://rauberlabs.blogspot.com/", 0, 0, native.systemFontBold, 16 )
	]]--
	
	-- MUST return a display.newGroup()
	return localGroup

end
