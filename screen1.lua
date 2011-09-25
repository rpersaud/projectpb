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
		
	-- The sound that bombs make when coming into contact with objects
	local explosionSound = media.newEventSound( "explosion.mp3" )	
		
	-- Display Objects
	local background = display.newImage( "bg1.jpg" )
	localGroup:insert(background)
	
	-- Create static ground to impact falling objects
	local floor = display.newRect( 0, 602, 960, 1)
	localGroup:insert(floor)
	floor:setReferencePoint(display.CenterReferencePoint)
	floor.isVisible = false
	physics.addBody(floor, "static", {friction=0.5})
	
	-- Display randomly placed targets to destroy
	local targets = {}
	for i = 1, 5 do
        targets[i] = display.newImage("penguin.png", math.random(960), 550)
        localGroup:insert(targets[i])
        physics.addBody(targets[i], { density=0.2, friction=0.1, bounce=0.5})
	end
		
	--Apply force to any objects that come into contact w/ blast radius
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
	       if (math.abs(forcex) > 60 or math.abs(forcey) > 60) then
	           local explosion = display.newImage( "explosion.png", event.other.x, event.other.y )
	           --event.other:removeSelf()
	           local function removeExplosion( event )
	               explosion:removeSelf()
	           end
	           timer.performWithDelay( 50, removeExplosion )
	       end
        end
     
        if ( event.phase == "began" and self.myName == "bomb" ) then
            media.playEventSound( explosionSound )
            local explosion = display.newImage( "explosion.png", event.other.x, event.other.y )
            self:removeSelf()
            local function removeBomb ( event )
                self:removeSelf()
            end
	        local function removeExplosion( event )
	           explosion:removeSelf()
            end
            --timer.performWithDelay( 1000, removeBomb )
	        timer.performWithDelay( 100, removeExplosion )
        end
    end
			
	-- Create a bomb wherever the user touches the screen; Physics apply.
	local function setBomb (event)
	   if (event.phase == "began") then
	       local bomb = display.newImage("bomb.png", event.x, event.y)
	       bomb.myName = "bomb"
	      -- localGroup:insert(bomb)
	       physics.addBody( bomb, {density=0.2, friction=0.1, bounce=0.5} )
	       bomb.collision = onLocalCollision
	       bomb:addEventListener( "collision", bomb )
	       
	       	-- Create a blast radius
            local circle = ""
            local explosion = ""
            local function blast ( event )
                media.playEventSound( explosionSound )
               -- @todo calculate blast radius + explosion gfx based on height
               circle = display.newCircle(bomb.x, bomb.y, 80)
              -- explosion = display.newImage("explosion.png", bomb.x, bomb.y)
               circle:setFillColor(255,255,255,50)
               physics.addBody( circle, "static", {isSensor = true} )
               circle.myName = "circle"
               circle.collision = onLocalCollision
               circle:addEventListener( "collision", circle )
               bomb:removeSelf()
            end
            
            local function removeStuff( event )
                circle:removeSelf()
                explosion:removeSelf()
            end
           -- timer.performWithDelay( 1000, blast )
            --timer.performWithDelay( 1100, removeStuff )
	    end
  	end
	background:addEventListener("touch", setBomb)
		
	
	-- MUST return a display.newGroup()
	return localGroup

end