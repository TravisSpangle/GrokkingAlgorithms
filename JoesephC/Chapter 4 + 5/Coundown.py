#Countdown code

def countdown(n):
    if n <= 0:
        return n
    return n , countdown(n-1)
