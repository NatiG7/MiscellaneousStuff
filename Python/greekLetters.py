'''
Prints a list of greek letters and their codes for referencing
and printing them in outputs.
'''
# ASCII Code range for greeks, 945,970
greek_letterz=[chr(code) for code in range(945,970)]

for i in range(len(greek_letterz)):
    # Prints all greek letters and their code.
    print(f"Letter : {greek_letterz[i]}, code : {ord(greek_letterz[i])}\n")