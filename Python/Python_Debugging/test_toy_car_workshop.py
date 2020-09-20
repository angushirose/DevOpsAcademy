import unittest

from test_toy_car_workshop import TestToyCarWorkshop

class TestToyCarWorkshop(unittest.TestCase):

    def test_calculate_cars(self):
        testInstance = TestToyCarWorkshop()
        self.assertEqual(testInstance.test_calculate_cars())

if __name__ == '__main__':
    unittest.main()
