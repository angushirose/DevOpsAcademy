import sys, traceback, unittest

count = 0


class Collatz(unittest.TestCase):

    def collatz_sequence(self, num):
        try:
            global count
            if num != 2:
                if num % 2 == 0:
                    count += 1
                    self.collatz_sequence(self.argiseven(num))
                elif num % 2 != 0:
                    count += 1
                    self.collatz_sequence(self.argisodd(num))
            else:
                return count

        except Exception:
            print("Exception occurred ")
            traceback.print_exc(file=sys.stdout)

    def argiseven(self, even_num):
        print("Even number is ", even_num)
        return even_num / 2

    def argisodd(self, odd_num):
        print("Odd number is ", odd_num)
        return (odd_num * 3) + 1