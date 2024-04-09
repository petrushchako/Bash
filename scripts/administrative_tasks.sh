#!/bin/bash

# Function to display disk usage
check_disk_usage() {
  echo "Checking disk usage..."
  df -h
  echo ""
}

# Function to display current system memory usage
check_memory_usage() {
  echo "Checking memory usage..."
  free -h
  echo ""
}

# Function to list top 10 processes by CPU usage
top_cpu_processes() {
  echo "Listing top 10 CPU-hogging processes..."
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head
  echo ""
}

# Function to update package lists and upgrade system (Debian/Ubuntu-based)
update_system() {
  echo "Updating and upgrading the system (requires sudo)..."
  sudo apt update && sudo apt upgrade -y
  echo "System updated."
  echo ""
}

# Function to manage users (add a new user)
add_user() {
  echo "Enter the username you want to add:"
  read username
  sudo adduser "$username"
  echo "User $username added."
  echo ""
}

# Function to check active network connections
check_network_connections() {
  echo "Checking active network connections..."
  netstat -tuln
  echo ""
}

# Display a menu for the user to choose an option
while true; do
  echo "Select an administrative task:"
  echo "1. Check disk usage"
  echo "2. Check memory usage"
  echo "3. List top 10 CPU processes"
  echo "4. Update and upgrade the system"
  echo "5. Add a new user"
  echo "6. Check active network connections"
  echo "7. Exit"
  read -p "Enter your choice: " choice
  
  case $choice in
    1) check_disk_usage ;;
    2) check_memory_usage ;;
    3) top_cpu_processes ;;
    4) update_system ;;
    5) add_user ;;
    6) check_network_connections ;;
    7) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option, please try again." ;;
  esac
done
