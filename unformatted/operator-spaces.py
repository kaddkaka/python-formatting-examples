BASE = 0

def operator_spaces(a, offset, x, y):
    a = a[42-x :  y**3]
    b = BASE + offset*10

    c = a[42 - x:y ** 3]
    d = BASE + offset * 10
    return a+b * c+d

