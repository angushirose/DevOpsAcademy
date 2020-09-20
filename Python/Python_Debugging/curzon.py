

class Curzon():

    def calc_curzon(self, num):
        if self.return_power_plus_one(num) % self.return_number_times_n(num) == 0:
            return True
        else:
            return False

    def return_power_plus_one(self, num):
        return (2 ** num) + 1

    def return_number_times_n(self, num):
        return (2 * num) + 1