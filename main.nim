import std/os
import std/strformat

const VERSION = "0.1.0 EARLY TEST"

var running = true

echo &"Welcome to TaskBypasser v{VERSION}\n"

while running:
    echo """
Please enter a command:
- tasks | list every running task
- kill | stop a task from running
- exit | stop the program
"""

    let input = readLine(stdin)

    # list every running task
    if input == "tasks":
        echo "\nListing every running task\n"
        discard execShellCmd(&"TASKLIST")
    
    # murder a task
    elif input == "kill":
        echo "\nWhat task would you like to kill?"

        let task_to_kill = readLine(stdin)
        echo &"Killing task: {task_to_kill}"

        discard execShellCmd(&"TSKILL {task_to_kill}")

    # close the program
    elif input == "exit":
        running = false

    echo "\n"
