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
	
	-- Create static ground to impact falling objects
	local floor = display.newRect( 0, 602, 960, 1)
	floor:setReferencePoint(display.CenterReferencePoint)
	floor.isVisible = false
	--floor.isHitTestable = true
	physics.addBody(floor, "static", {friction=0.5})
	
	local bombs = {}
	
	for i = 1, 10 do
	   --for j = 1, 5 do
	       bombs[i] = display.newImage("bomb.png", math.random(960), math.random(600))
	       physics.addBody(bombs[i], { density=0.2, friction=0.5, bounce=0.5})
	   --end
	end
	
	-- Add objects to display
	localGroup:insert(background)
	localGroup:insert(floor)	

	--[[
	local title      = display.newText( "Director Class", 0, 0, native.systemFontBold, 16 )
	local createdBy  = display.newText( "Created by Ricardo Rauber", 0, 0, native.systemFontBold, 16 )
	local website    = display.newText( "http://rauberlabs.blogspot.com/", 0, 0, native.systemFontBold, 16 )
	]]--
	
	-- MUST return a display.newGroup()
	return localGroup

end
