# Dot source the InputSimulator type and functions
. .\InputSimulator.ps1
. .\InputSimulatorFunctions.ps1

# --- Step 1: Mouse Logic ---
$step1Logic = {
    [InputSimulator]::SetMousePosition(0, 0)
}

# --- Step 2: Simulate Key Press ---
$step2Logic = {
    [InputSimulator]::SetMousePosition(50, 50)
    FlashMouseCursor
    [InputSimulator]::PressKey(0x41)  # Press the 'A' key
}

# --- Step 3: Print String to Console (simulating typing) ---
$step3Logic = {
    [InputSimulator]::SetMousePosition(500, 500)
    FlashMouseCursor
    [string]$textContentStep3 = "This is step 3"
    TypeString $textContentStep3  # Simulate typing the string
    Write-Host $textContentStep3  # Print the string to the console
}

# --- Placeholder for Step 4 and beyond ---
$step4Logic = {
    [InputSimulator]::SetMousePosition(5000, 1000)
    FlashMouseCursor
    Write-Host "Placeholder for Step 4 logic"
}

# Execute steps one by one with confirmation
ExecuteStep -stepLogic $step1Logic -description "Move mouse and click" -stepNumber 1
ExecuteStep -stepLogic $step2Logic -description "Simulate pressing 'A' key" -stepNumber 2
ExecuteStep -stepLogic $step3Logic -description "Print string to console" -stepNumber 3
ExecuteStep -stepLogic $step4Logic -description "Placeholder for future logic" -stepNumber 4

# Display the current date and time
$date = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
Write-Host "Current Date and Time: $date"
