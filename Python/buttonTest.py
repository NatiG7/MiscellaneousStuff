import tkinter as tk

# Using tkinter to open an interactive GUI window in python
# This snip is meant to understand button actions in tk.

# What happens when you click buttons
## Select button
def onSelect():
    print("Yes")
    print("Confirm button clicked")

## Cancel button
def onCancel():
    print("No")
    print("Cancel button clicked")

# Spawning the Tk window
root = tk.Tk()
root.title("Test Buttons")
root.geometry("300x150+500+300")

# Set buttons
confirmButton = tk.Button(root, text="Confirm", command=onSelect)
confirmButton.pack(pady=20)
cancelButton = tk.Button(root, text="Cancel", command=onCancel)
cancelButton.pack(pady=20)

# Launch window.
root.mainloop()
