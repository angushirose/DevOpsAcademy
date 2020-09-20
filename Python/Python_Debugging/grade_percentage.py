class GradePercentage:

    def grade_percentage(self, user_score, pass_score):
        p = 'PASSED'
        f = 'FAILED'
        if (self.check_user_score(int(user_score[:-1]), int(pass_score[:-1]))):
            return 'You' + ' ' + p + ' ' + 'the Exam'
        else:
            return 'You' + ' ' + f + ' ' + 'the Exam'

    def check_user_score(self, user_score, pass_score):
        if user_score <= pass_score:
            return False
        else:
            return True