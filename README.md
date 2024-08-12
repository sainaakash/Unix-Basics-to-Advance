# Unix-Basics-to-Advance

Online Employee Management System

Online Employee Management System is a Unix based application used to manage the employees of ABC company. This application allows to add, delete, and update the details of the employee.  The users can also view the details of the employees.

Write a shell scrip to automate the above process for Online Employee Management System

Files to be used:

1.       User.txt

                  The file content is in the format:

                   “Username#password”

                   For Example:

                   Robert#rob@123

                   Tally#tr_12

2.       Employee.txt

                   The file content is in the format:

                   “emp_num#name#dept#mobile#salary”

                   For Example:

                   1001#Jhon#SPD#9087654321#123456

                   1002#Maria#HRD#1234567890#908765

Skeleton of ‘solution.sh’ file:



<b>- display(): </b>

This function displays the menu and prompts the user to select an option
The output of the function is as follows:

************ Welcome to Online Employee Management System ************
1.	Add Employee
2.	Delete Employee
3.	Update Employee Details
4.	View Employee
5.	Exit
Enter your choice: 

<b>- login (): </b>

This function will accept the username and password as the command line argument
The entered username must match the username and password present in Users.txt file

If present , invoke the display function

Else,
Return with status code 8


<b>- menu(): </b>

This function should accept the ‘choice’ selected from the display function as a command line argument

If the choice is 1 then,
Prompt the user to enter the name, dept, mobile number and salary  to add the employee
Invoke the function add_employee() with the prompted data as command line argument

If the choice is 2 then,
Prompt the user to enter the emp_num to delete the emoloyee
Invoke the function delete_employee() with the prompted emp_num as command line arguments

If the choice is 3 then,
Prompt the user to enter the emp_num,name,department,mobile number and salary to update the details
Invoke the function update_details() with the prompted emp_num as command line argument

If the choice is 4 then
Prompt the user to enter the department  to list the details of the employee
Invoke the function view_details() with the prompted dept as command line argument

If the choice is 5 then, exit with the status code 6

Else, return with the status code 7


<b>- add_employee(): </b>

This function accepts name, deptartment, mobile number and salary as command line arguments

Validation:
‘emp_num’ should be a four-digit number, which starts from 1001 and needs to be auto generated
‘name’ should contain alphabets, in upper case or lower-case characters only
‘dept’ should be a 3-character string, in upper case only
‘mobile_num’ should be a 10-digit number
‘salary’ should be 6-digit number which is greater than 0

If the validation is true, then
Insert the details into employee.txt file
After successful insertion, display the message “Employee added successfully.  Employee Number is <emp_num>”
Return with status code 9

Else, return with status code 1

<b>- delete_employee(): </b>

This function accepts the emp_num as a command line argument
Check whether the given ‘emp_num’ is present in ‘Employee.txt’ file

If present, delete the details of the employee from ‘Employee.txt’
After successful deletion display “Employee Deleted Successfully”
Return with status code 12

Else, return with status code 2

<b>- update_details(): </b>

This function accepts the emp_num, name, department, mobile number and salary as command line arguments
Check whether the given ‘emp_num’ is present in ‘Employee.txt’ file

If present, then

Validation:
‘name’ should contain alphabets, in upper case or lower-case characters only
‘dept’ should be a 3-character string, in upper case only
‘mobile_num’ should be a 10-digit number
‘salary’ should be 6-digit number which is greater than 0

If the validation is true, then
Update the details for the corresponding employee number in employee.txt file
After updating the file, display the message “Employee Details Updated Successfully”
Return status code 10

Else, return with status code 3

Else, return with status code 4

</b>- view_details(): </b>

This function accepts the dept as a command line argument
Check whether the dept is present in the ‘employee.txt’ file

If present, then
Then display all the details of employees from the file ‘Employee.txt’ it in the below given format
Emp_num#name#mobile#salary
For E.g.  if the dept entered if ‘SPD’
1001#John#SPD#9087654321#234456
Return with status code 11

Else, return with status code 5
