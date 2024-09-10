# Load Windows Forms assembly
Add-Type -AssemblyName System.Windows.Forms

# Define a .NET class within PowerShell
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class InputSimulator
{
    // Import the user32.dll library to use Windows API functions
    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
    
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);
    
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    // Define constants for mouse events
    public const int MOUSEEVENTF_LEFTDOWN = 0x0002;
    public const int MOUSEEVENTF_LEFTUP = 0x0004;

    // Define constants for keyboard events
    public const int KEYEVENTF_KEYUP = 0x0002;
    public const byte VK_A = 0x41; // Virtual key code for 'A'

    // Method to set mouse position
    public static void SetMousePosition(int x, int y)
    {
        SetCursorPos(x, y);
    }

    // Method to simulate a mouse click
    public static void ClickMouse()
    {
        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // Mouse button down
        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);   // Mouse button up
    }

    // Method to simulate a key press
    public static void PressKey(byte key)
    {
        keybd_event(key, 0, 0, 0); // Key down
        keybd_event(key, 0, KEYEVENTF_KEYUP, 0); // Key up
    }
}
"@

# Define a function to display a Yes/No dialog
function Show-YesNoDialog {
    param (
        [string]$message
    )

    $result = [System.Windows.Forms.MessageBox]::Show($message, "Confirmation", [System.Windows.Forms.MessageBoxButtons]::YesNo)
    return $result
}

# Perform a series of actions
# Set mouse position to (x: 100, y: 200)
[InputSimulator]::SetMousePosition(100, 200)

# Simulate a mouse click
[InputSimulator]::ClickMouse()

# Wait for user confirmation
$result = Show-YesNoDialog "Nickel wire tied?"

# Handle user response
if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
    Write-Host "User selected Yes"
    # Continue with further actions or logic
} elseif ($result -eq [System.Windows.Forms.DialogResult]::No) {
    Write-Host "User selected No"
    # Handle No response accordingly
}

# Simulate pressing the 'A' key
[InputSimulator]::PressKey([InputSimulator]::VK_A)

# Optional: Add more actions and prompts as needed
