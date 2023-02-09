import sys
import os

if len(sys.argv) != 2:
    print(f"Uso: python {sys.argv[0]} (add/rem)")
    sys.exit(1)

# Check if deaths file exists
if not os.path.isfile("deaths.txt"):
    print("No se encuentra el archivo de muertes.")
    sys.exit(1)

# Open file
with open("deaths.txt", "r") as f:
    deaths = f.read().split(" ")[1]  # Read deaths from file
    if sys.argv[1] == "add":  # Update death counter depending on the first arg
        deaths = int(deaths) + 1
    elif sys.argv[1] == "rem":
        deaths = int(deaths) - 1
    else:
        print(f"Uso: python3 {sys.argv[0]} (add/rem)")
        sys.exit(1)

    # Write deaths to file
    with open("deaths.txt", "w") as f:
        f.write(f"Muertes: {deaths}\n")
