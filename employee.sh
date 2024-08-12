#!/bin/bash

generate_emp_num() {
    if [[ ! -f employee.txt ]]; then
        echo "1001"
    else
        last_emp_num=$(tail -n 1 employee.txt | cut -d "#" -f 1)
        echo $((last_emp_num + 1))
    fi
}

# Function to add an employee
add_employee() {
    local name="$1"
    local dept="$2"
    local mobile_num="$3"
    local salary="$4"

    # Generate employee number
    local emp_num
    emp_num=$(generate_emp_num)

    # Validate name (only alphabets)
    if [[ ! "$name" =~ ^[a-zA-Z]+$ ]]; then
        echo "Invalid name. It should contain only alphabets."
        return 1
    fi

    # Validate department (3 uppercase letters)
    if [[ ! "$dept" =~ ^[A-Z]{3}$ ]]; then
        echo "Invalid department. It should be a 3-character string in uppercase."
        return 1
    fi

    # Validate mobile number (10 digits)
    if [[ ! "$mobile_num" =~ ^[0-9]{10}$ ]]; then
        echo "Invalid mobile number. It should be a 10-digit number."
        return 1
    fi

    # Validate salary (6-digit number greater than 0)
    if [[ ! "$salary" =~ ^[1-9][0-9]{5}$ ]]; then
        echo "Invalid salary. It should be a 6-digit number greater than 0."
        return 1
    fi

    # If all validations pass, add the employee to the file
    echo "$emp_num#$name#$dept#$mobile_num#$salary" >> employee.txt
    echo "Employee added successfully. Employee Number is $emp_num"
    return 9
}

# Function to delete an employee
delete_employee() {
    local emp_num="$1"

    # Check if the employee.txt file exists
    if [[ ! -f employee.txt ]]; then
        echo "Employee file not found!"
        return 1
    fi

    # Search for the employee in the file
    if grep -q "^$emp_num#" employee.txt; then
        # Delete the employee from the file
        grep -v "^$emp_num#" employee.txt > temp.txt && mv temp.txt employee.txt
        echo "Employee with Emp_Num=$emp_num has been deleted."
        return 0
    else
        echo "Employee with Emp_Num=$emp_num not found."
        return 1
    fi
}

# Function to update employee details
update_details() {
    local emp_num="$1"
    local name="$2"
    local dept="$3"
    local mobile="$4"
    local salary="$5"

    # Check if the employee.txt file exists
    if [[ ! -f employee.txt ]]; then
        echo "Employee file not found!"
        return 1
    fi

    # Search for the employee in the file
    if grep -q "^$emp_num#" employee.txt; then
        # Validate name (only alphabets)
        if [[ ! "$name" =~ ^[a-zA-Z]+$ ]]; then
            echo "Invalid name. It should contain only alphabets."
            return 1
        fi

        # Validate department (3 uppercase letters)
        if [[ ! "$dept" =~ ^[A-Z]{3}$ ]]; then
            echo "Invalid department. It should be a 3-character string in uppercase."
            return 1
        fi

        # Validate mobile number (10 digits)
        if [[ ! "$mobile" =~ ^[0-9]{10}$ ]]; then
            echo "Invalid mobile number. It should be a 10-digit number."
            return 1
        fi

        # Validate salary (6-digit number greater than 0)
        if [[ ! "$salary" =~ ^[1-9][0-9]{5}$ ]]; then
            echo "Invalid salary. It should be a 6-digit number greater than 0."
            return 1
        fi

        # Update the employee details
        grep -v "^$emp_num#" employee.txt > temp.txt
        echo "$emp_num#$name#$dept#$mobile#$salary" >> temp.txt
        mv temp.txt employee.txt

        echo "Employee details updated successfully. Emp_Num=$emp_num"
        return 0
    else
        echo "Employee with Emp_Num=$emp_num not found."
        return 1
    fi
}

# Function to view employee details by department
view_details() {
     local dept="$1"

    # Check if the employee.txt file exists
    if [[ ! -f employee.txt ]]; then
        echo "Employee file not found!"
        return 1
    fi

    # Search and display employees in the given department
    if grep -q "#$dept#" employee.txt; then
        echo "Employees in Department: $dept"
        grep "#$dept#" employee.txt
        return 0
    else
        echo "No employees found in Department: $dept"
        return 1
    fi
}

# Menu function to handle the user choice
menu() {
    local choice="$1"

    if [ "$choice" -eq 1 ]; then
        read -p "Enter Name: " name
        read -p "Enter Department: " dept
        read -p "Enter Mobile Number: " mobile
        read -p "Enter Salary: " salary
        add_employee "$name" "$dept" "$mobile" "$salary"
        exit $?

    elif [ "$choice" -eq 2 ]; then
        read -p "Enter Employee Number: " emp_num
        delete_employee "$emp_num"
        exit $?

    elif [ "$choice" -eq 3 ]; then
        read -p "Enter Employee Number: " emp_num
        read -p "Enter Name: " name
        read -p "Enter Department: " dept
        read -p "Enter Mobile Number: " mobile
        read -p "Enter Salary: " salary
        update_details "$emp_num" "$name" "$dept" "$mobile" "$salary"
        exit $?

    elif [ "$choice" -eq 4 ]; then
        read -p "Enter Department: " dept
        view_details "$dept"
        exit $?

    elif [ "$choice" -eq 5 ]; then
        echo "Exiting..."
        exit 6

    else
        echo "Invalid choice"
        exit 7
    fi
}

# Example of how to use the menu function
# Display the menu and prompt for user input
display_menu() {
    echo "************ Welcome to Online Employee Management System ************"
    echo "1. Add Employee"
    echo "2. Delete Employee"
    echo "3. Update Employee Details"
    echo "4. View Employee"
    echo "5. Exit"
    echo -n "Enter your choice: "
}

# Display the menu
display_menu

# Read the user's choice
read choice

# Pass the choice to the menu function
menu "$choice"
