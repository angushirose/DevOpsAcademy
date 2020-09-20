import unittest

from curzon import Curzon

class TestCurzon(unittest.TestCase):

    #@unittest.skip
    def test_curzon_numer(self):
        curzonTestInstance = Curzon()
        self.assertEqual(True, curzonTestInstance.calc_curzon(5))

    def test_exp(self):
        curzonTestInstance = Curzon()
        self.assertEqual(33, curzonTestInstance.return_power_plus_one(5))
        self.assertEqual(257, curzonTestInstance.return_power_plus_one(8))
        self.assertEqual(16385, curzonTestInstance.return_power_plus_one(14))

    def test_number_multiply(self):
        curzonTestInstance = Curzon()
        self.assertEqual(7, curzonTestInstance.return_number_times_n(3))
        self.assertEqual(25, curzonTestInstance.return_number_times_n(12))
        self.assertEqual(41, curzonTestInstance.return_number_times_n(20))

if __name__ == '__main__':
        unittest.main()