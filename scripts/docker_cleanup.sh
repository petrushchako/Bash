#!/bin/bash

while true; do
    clear
    echo "===== Docker Cleanup Menu ====="
    echo "1) Remove stopped containers"
    echo "2) Remove dangling images"
    echo "3) Remove all unused images"
    echo "4) Remove unused networks"
    echo "5) Remove unused volumes"
    echo "6) Full system cleanup (excludes volumes)"
    echo "7) Full system cleanup (includes volumes)"
    echo "8) Exit"
    echo "================================"
    read -p "Choose an option: " choice

    case $choice in
        1) 
            echo "Removing stopped containers..."
            docker container prune -f
            ;;
        2) 
            echo "Removing dangling images..."
            docker image prune -f
            ;;
        3) 
            echo "Removing all unused images..."
            docker image prune -a -f
            ;;
        4) 
            echo "Removing unused networks..."
            docker network prune -f
            ;;
        5) 
            echo "Removing unused volumes..."
            docker volume prune -f
            ;;
        6) 
            echo "Running full system cleanup (excluding volumes)..."
            docker system prune -f
            ;;
        7) 
            echo "Running full system cleanup (including volumes)..."
            docker system prune -a -f --volumes
            ;;
        8) 
            echo "Exiting cleanup script."
            exit 0
            ;;
        *) 
            echo "Invalid option. Please choose a valid number."
            ;;
    esac

    echo "Press Enter to continue..."
    read
done