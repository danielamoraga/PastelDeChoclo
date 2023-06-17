extends Node2D

var lights = []  # Array to hold all the PointLight2D nodes

var baseEnergy = 1.0
var minEnergy = 0.8
var maxEnergy = 1.2
var sparkleSpeed = 2
var timer = 0

func _ready():
	# Find and store all PointLight2D nodes that are child nodes
	for child in get_children():
		if child is PointLight2D:
			lights.append(child)

func _process(delta):
	timer += delta
	
	# Update each PointLight2D node in the lights array
	for light in lights:
		# Calculate the sparkle factor using a sine function
		var sparkleFactor = minEnergy + (maxEnergy - minEnergy) * (1.0 + sin(timer * sparkleSpeed)) / 2.0
		
		# Set the energy of the light with the base value multiplied by the sparkle factor
		light.energy = baseEnergy * sparkleFactor
