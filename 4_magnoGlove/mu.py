import time
import board
import adafruit_mmc56x3

i2c = board.I2C()
sensor = adafruit_mmc56x3.MMC5603(i2c)

while True:
    mag_x, mag_y, mag_z = sensor.magnetic
    temp = sensor.temperature

    print((mag_x, mag_y, mag_z))
    time.sleep(0.25)
