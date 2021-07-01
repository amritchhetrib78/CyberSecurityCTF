# Nested Exception Secoding Examples


# Secure Coding for Exception:
def read(filename):
    file = open(filename, "r")  # oops, forgot the 'w'
    try:
        lines = file.readlines()
        try:
            # Second exception
            CountText(lines)
        except Exception:
            print("Error on Computation")
    except Exception:
        print("Error in Opening File")
    finally:
        file.close()  # oops, misspelled 'close'
def CountText(lines):
    #print("Count:", lines.count())  # Erroe on Code
    print("Printing ")
read('Secure-Coding-Data.txt')
