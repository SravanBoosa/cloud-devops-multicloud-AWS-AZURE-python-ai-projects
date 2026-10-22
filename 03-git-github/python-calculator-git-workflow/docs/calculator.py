
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

print("\nChoose an operation:")
print("+  Addition")
print("-  Subtraction")
print("*  Multiplication")
print("/  Division")

operation = input("Enter your choice (+, -, *, /): ")

if operation == "+":
    result = num1 + num2
    print("Result:", result)

elif operation == "-":
    result = num1 - num2
    print("Result:", result)

elif operation == "*":
    result = num1 * num2
    print("Result:", result)

elif operation == "/":
    if num2 != 0:
        result = num1 / num2
        print("Result:", result)
    else:
        print("Error: Cannot divide by zero.")

else:
    print("Invalid operation. Please enter +, -, *, or /.")

