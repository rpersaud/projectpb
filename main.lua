-- 
-- Abstract: Sample Project PB 
-- Designed and created by Robert Persaud exclusively for Gamengineers, Inc.
-- http://www.gamengineers.com/projectpb

-- (This app was intended for iPhone4G, but should work on all other iOS and Android devices)
-- 
-- Version: 0.01
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2011 Gamengineers Inc. All Rights Reserved.

-- SOME INITIAL SETTINGS
display.setStatusBar( display.HiddenStatusBar ) --Hide status bar from the beginning

-- Import director class
local director = require("director")

-- Setting up physics engine
local physics = require("physics")
physics.start()
--physics.setDrawMode("debug")

-- Define constants for height and width
_W = display.contentWidth
_H = display.contentHeight

-- Create a main group
local mainGroup = display.newGroup()

-- Main function
local function main()
	
	-- Add the group from director class
	mainGroup:insert(director.directorView)
	
	-- Uncomment below code and replace init() arguments with valid ones to enable openfeint
	--[[
	openfeint = require ("openfeint")
	openfeint.init( "App Key Here", "App Secret Here", "App Title", "App ID Here" )
	]]--
	
	-- Change scene without effects
	director:changeScene( "screen1" )

	return true
end

-- Begin
main()