local coopEvolved = require "insurrection.constants.projects.coopEvolved"
local helljumper = require "insurrection.constants.projects.helljumper"
local stock = require "insurrection.constants.projects.stock"
local firefight = require "insurrection.constants.projects.firefight"

return table.extend(stock.maps, coopEvolved.maps.coop, helljumper.maps.multiplayer, firefight.maps.singleplayer)
