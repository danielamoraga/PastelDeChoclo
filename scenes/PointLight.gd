extends PointLight2D

var baseEnergy = 1.2  # The base energy value of the light
var minEnergy = 0.8   # The minimum energy value for the sparkle
var maxEnergy = 1.6   # The maximum energy value for the sparkle
var sparkleSpeed = 1  # The speed at which the light sparkles

var timer = 0         # Internal timer variable

func _process(delta):
	timer += delta
	
	# Calculate the sparkle factor using a sine function
	var sparkleFactor = minEnergy + (maxEnergy - minEnergy) * (1.0 + sin(timer * sparkleSpeed)) / 2.0
	
	# Set the energy of the light with the base value multiplied by the sparkle factor
	energy = baseEnergy * sparkleFactor
