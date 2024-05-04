def is_palindrome(no):
    digits = list(str(no))
    for i in range(int(len(digits) / 2)) :
        if digits[i] != digits[len(digits) - 1 - i]:
            return False
    return True

max_palindrome = 1

bigger = list(range(11, 1000))
bigger.reverse()
for d1 in bigger:
    smaller = list(range(11, d1 + 1))
    smaller.reverse()
    for d2 in smaller:
        check = d1 * d2
        if is_palindrome(check) :
            max_palindrome = max(max_palindrome, check)
            break
    
print(max_palindrome)