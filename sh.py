print("Custom shortcuts:")
printing_functions = False

with open("/home/subrat/.bash_aliases", "r") as f:
    for line in f:
        line = line.strip()
        if (printing_functions):
            print(line)
        if (line == "# functions"):
            printing_functions = True
            print("\nCustom Functions:")
            continue
        line = line.replace("alias ", "")
        words = line.split("=")
        if (len(words) == 2):
            if (len(words[0]) > 7):
                line = words[0] + "\t" + words[1]
            else:
                line = words[0] + "\t\t" + words[1]
            print(line)
    