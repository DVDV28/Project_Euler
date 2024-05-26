"""
Generates a python file with a problem template in the `solutions` directory.
"""

import sys


def create_module(num: str):
    raise NotImplementedError("Not implemented yet")


def run():
    # Check if the argument is provided
    if len(sys.argv) != 2:
        print("Usage: poetry run euler <integer>")
        sys.exit(1)

    # Try to convert the argument to an integer
    try:
        num = int(sys.argv[1])
    except ValueError:
        print("Error: Please provide a valid integer argument")
        sys.exit(1)

    # Ensure not negative
    if num < 0:
        print("Error: Please provide a positive integer argument")
        sys.exit(1)

    # Convert to 3 digit
    num = str(num).zfill(3)

    try:
        create_module(num)
    except ModuleNotFoundError as e:
        print(f"Error: Euler problem {num} not found. Original error:\n{e}")
        sys.exit(1)


if __name__ == "__main__":
    run()
