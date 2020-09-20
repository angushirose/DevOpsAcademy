import unittest

from cone_volume import ConeVolume

class TestConeVolume(unittest.TestCase):

    def test_calc_volume(self):
         cone_test_case = ConeVolume()
         self.assertEqual(12.57, cone_test_case.calc_volume(3, 2))


    def test_radius_exp(self):
        cone_test_case = ConeVolume()
        self.assertEqual(4, cone_test_case.calc_radius_exp(2))
        self.assertEqual(64, cone_test_case.calc_radius_exp(8))



