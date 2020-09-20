import math

class ConeVolume():

    # vol = 1/3 * pi * r ** 2 * h
    def calc_volume(self, height, radius):
        return round((math.pi * self.calc_radius_exp(radius) * height) / 3, 2)

    def calc_radius_exp(self, radius):
        return radius ** 2

