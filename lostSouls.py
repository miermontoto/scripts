import sys
import os

fileName = "lostSouls.txt"

# File that adds number of lost souls from user input
if len(sys.argv) != 2:
    print(f"Uso: python3 {sys.argv[0]} <numSouls>")
    sys.exit(1)

# Check if souls is a valid number
if not sys.argv[1].isdigit():
    print("Error: numSouls debe ser un número real.")
    sys.exit(1)

# Check if file exists and then process it
if not os.path.isfile(fileName):
    print("No se encuentra el archivo de almas perdidas.")
    sys.exit(1)

with open(fileName, "r") as f:
    souls = int(f.read().split(" ")[2]) + int(sys.argv[1])
with open(fileName, "w") as f:
    f.write(f"Almas perdidas: {souls}\n")
