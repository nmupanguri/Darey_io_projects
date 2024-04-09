#!/bin/bash

# This script generates a multiplication table for a given number. The scrip prompts the user to 
# enter a number and then display the multiplication table for that number up to 10. It uses both
# the list for mand C-style for to display the multiplication table.


# Prompt the user and capture user preferences
read -p "Enter a number for the multiplication table: " number
read -p "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): " option

case $option in
    "F" | "f" ) 
        read -p "Do you want to see the table in ascending or descending order? (Enter 'a' for ascending, 'd' for descending: " order  
        # The if condition uses regular expressions to check whether user entered values are numbers
        if [[ $number =~ ^[0-9]+$ ]]; then
            echo "The full multiplication table for" $number":"
            case $order in
                "A" | "a" )
                    # The for loop below uses the List Form to iterrate and print a multiplication table in ascending order
                    for i in $(seq 1 10); do
                        echo $number "x" $i "=" $(expr $number \* $i) 
                    done
                    ;;
                "D" | "d" )
                    # The for loop below uses the List Form to iterrate and print a multiplication table in descending order
                    for i in $(seq 10 -1 1); do
                        echo $number "x" $i "=" $(expr $number \* $i) 
                    done
                    ;;
                *)   
                    echo "Invalid order option."
                    ;;
            esac
        else
            echo "Invalid number"
        fi
        ;;

    "P" | "p" )   
        read -p "Enter the starting number (between 1 and 10):" start
        read -p "Enter the ending number (between 1 and 10):" end
        read -p "Do you want to see the table in ascending or descending order? (Enter 'a' for ascending, 'd' for descending: " order
        
        # The if condition uses regular expressions to check whether user entered values are numbers
        if [[ $number =~ ^[0-9]+$ && $start =~ ^[0-9]+$ && $end =~ ^[0-9]+$ && $start -lt $end ]]; then
            echo "The partial multiplication table for" $number "from" $start "to" $end":"
            case $order in
                "A" | "a" )            
                    # The for loop below uses the C-Style Form to iterrate and print a multiplication table in ascending order
                    for ((i=$start; i<=$end; i++)); do
                        echo $number "x" $i "=" $(expr $number \* $i) 
                    done
                    ;;
                "D" | "d" )
                    # The for loop below uses the C-Style Form to iterrate and print a multiplication table in descending order
                    for ((i=$end; i>=$start; i--)); do
                        echo $number "x" $i "=" $(expr $number \* $i) 
                    done
                    ;;
                *)   
                    echo "Invalid order option."
                    ;;
            esac
        else
            echo "Invalid range"
        fi
        ;;
    *)   
        echo "Invalid option. Please try again"
        ;;
esac
