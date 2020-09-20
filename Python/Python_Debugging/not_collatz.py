import unittest, sys

from collatz import Collatz


class CollatzTest(unittest.TestCase):

    def makeOne(self, clear=False):
        if clear:
            try:
                del sys.modules['collatz']
            except KeyError:
                pass
        from collatz import Collatz
        return Collatz

    def test_collatz(self):
        collatz = self.makeOne(clear=True)

    def test_even_arg_returns_five(self):
        collatz = self.makeOne(clear=True)
        self.assertEqual(5, collatz.argiseven(collatz, 10))

    def test_odd_arg_returns_sixteen(self):
        collatz = self.makeOne(clear=True)
        self.assertEqual(16, collatz.argisodd(collatz, 5))

    def test_collatz_sequence_with_ten(self):
        collatz = self.makeOne(clear=True)
        self.assertEqual(6, collatz.collatz_sequence(collatz, 10))

    def test_collatz_sequence_with_four(self):
        collatz = self.makeOne(clear=True)
        self.assertEqual(1, collatz.collatz_sequence(collatz, 4))

    def test_collatz_sequence_with_two(self):
        collatz = self.makeOne(clear=True)
        self.assertEqual(0, collatz.collatz_sequence(collatz, 2))
