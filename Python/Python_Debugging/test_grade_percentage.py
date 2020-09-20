import unittest

from grade_percentage import GradePercentage

class TestGradePercentage(unittest.TestCase):

    def test_check_user_score(self):
        testInstance = GradePercentage()
        self.assertEqual(True, testInstance.check_user_score(95, 80))
        self.assertEqual(False, testInstance.check_user_score(87, 87))
        self.assertEqual(False, testInstance.check_user_score(60, 80))

    def test_grade_percentage(self):
        passed = 'You PASSED the Exam'
        failed = 'You FAILED the Exam'
        testInstance = GradePercentage()
        self.assertEqual(passed, testInstance.grade_percentage("97", "87"))
