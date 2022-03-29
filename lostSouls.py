import sys, os

fileName = "lostSouls.txt"

# File that adds number of lost souls from user input
if(len(sys.argv)) != 2:
    print(f"Uso: python3 {sys.argv[0]} <numSouls>")
    sys.exit(1)

# Check if souls is a valid number
if not sys.argv[1].isdigit() or int(sys.argv[1]) <= 0:
    print("Error: numSouls debe ser un número positivo")
    sys.exit(1)

# Check if file exists and then process it
if(os.path.isfile(fileName)):
    with open(fileName, "r") as f:
        souls = f.read().split(" ")[2]
        souls = int(souls) + int(sys.argv[1])
        with open(fileName, "w") as f:
            f.write(f"Almas perdidas: {souls}\n")
else:
    print("No se encuentra el archivo de almas perdidas.")
    sys.exit(1)
    