from gpiozero import Button, TrafficLights, Buzzer
from time import sleep

buzzer = Buzzer (15)
button = Button (21)
lights = TrafficLights (25, 8, 7)

while True:
	lights.green.on()
	button.wait_for_press()
	buzzer.on()
	lights.green.off()
	lights.amber.on()
	sleep(3)
	lights.amber.off()
	lights.red.on()
	sleep(10)
	lights.off()
	buzzer.off()
