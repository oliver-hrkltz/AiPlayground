import board
import adafruit_mmc56x3
import csv
import sys
import random
import string
import os

if (len(sys.argv) != 2):
    print("Missmatching arguments.")
    exit(1)

i2c = board.I2C()
sensor = adafruit_mmc56x3.MMC5603(i2c)
mag_x, mag_y, mag_z = sensor.magnetic
temp = sensor.temperature

# Creat an UID for the record
while True:
    characters = string.ascii_letters + string.digits
    uid = "".join(random.choice(characters) for i in range(4)).lower()

    # Check if the ID exists
    if not os.path.exists("data/" + sys.argv[1] + "." + uid + ".csv"):
        break

# Print some information for the user
print("File: data/" + sys.argv[1] + "." + uid + ".csv")
print(
    "X:{0:10.2f}, Y:{1:10.2f}, Z:{2:10.2f} uT\tTemp:{3:6.1f}*C".format(
        mag_x, mag_y, mag_z, temp
    )
)

# Save the record to a file inside data/ folder
with open("data/" + sys.argv[1] + "." + uid + ".csv", 'w', encoding="UTF8") as f:
    writer = csv.writer(f)
    writer.writerow(["x", "y", "z"])
    writer.writerow(["{:.2f}".format(mag_x), "{:.2f}".format(mag_y), "{:.2f}".format(mag_z)])
