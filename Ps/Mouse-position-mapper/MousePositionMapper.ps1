# Load Windows Forms assembly for capturing key presses and tooltips
Add-Type -AssemblyName System.Windows.Forms

# Define a .NET class within PowerShell
Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Threading;

public class InputUtils
{
    [DllImport("user32.dll")]
    public static extern bool GetCursorPos(out System.Drawing.Point lpPoint);

    public static System.Drawing.Point GetMousePosition()
    {
        System.Drawing.Point point;
        GetCursorPos(out point);
        return point;
    }
}
"@

# Define the file path to save mouse positions and the attempt number
$positionsFilePath = "MousePositions.txt"
$attemptNumberFilePath = "AttemptNumber.txt"

# Initialize or clear the positions file
Set-Content -Path $positionsFilePath -Value "Mouse Positions Log:`n" -Force

# Read the current attempt number from file or initialize to 0
if (Test-Path $attemptNumberFilePath) {
    $attemptNumber = [int](Get-Content $attemptNumberFilePath)
} else {
    $attemptNumber = 0
}

# Function to generate a unique ID
function New-UniqueId {
    [guid]::NewGuid().ToString()
}

# Function to write position to file with additional information
function Write-MousePosition {
    param (
        [string]$filePath,
        [int]$attemptNumber
    )
    $point = [InputUtils]::GetMousePosition()
    $uniqueId = New-UniqueId
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $position = "$attemptNumber`nDate: $timestamp`nUnique ID: $uniqueId`nPosition: X=$($point.X), Y=$($point.Y)`n"
    Add-Content -Path $filePath -Value $position
    Write-Host "Position recorded: Attempt $attemptNumber, ID $uniqueId, Date $timestamp"
}

# Function to show a tooltip message
function Show-Tooltip {
    param (
        [string]$message
    )
    $form = New-Object System.Windows.Forms.Form
    $label = New-Object System.Windows.Forms.Label
    $form.Text = "Mouse Position Mapper"
    $form.Size = New-Object System.Drawing.Size(300,100)
    $form.StartPosition = "CenterScreen"
    $label.Text = $message
    $label.AutoSize = $true
    $label.Dock = "Fill"
    $label.TextAlign = "MiddleCenter"
    $form.Controls.Add($label)
    $form.TopMost = $true
    $form.Show()
    Start-Sleep -Seconds 5
    $form.Close()
}

# Display the tooltip with instructions
Show-Tooltip -message "Move the mouse to the desired position and press F1 to record the position.`nPress ESC to exit."

# Loop to listen for key presses
while ($true) {
    # Check if F1 is pressed
    if ([System.Windows.Forms.Control]::ModifierKeys -eq [System.Windows.Forms.Keys]::F1) {
        $attemptNumber++
        Write-MousePosition -filePath $positionsFilePath -attemptNumber $attemptNumber
        
        # Save the new attempt number to file
        Set-Content -Path $attemptNumberFilePath -Value $attemptNumber
        
        # Small delay to avoid multiple recordings with a single press
        Start-Sleep -Milliseconds 500
    }
    # Check if ESC is pressed to exit
    if ([System.Windows.Forms.Control]::ModifierKeys -eq [System.Windows.Forms.Keys]::Escape) {
        Write-Host "Exiting Mouse Position Mapper."
        break
    }
    # Sleep to avoid high CPU usage
    Start-Sleep -Milliseconds 100
}
