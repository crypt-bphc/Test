import fileinput
for line in fileinput.input("config.ini", inplace=True):
    print (line.replace("gclone", "fclone"), end="")
