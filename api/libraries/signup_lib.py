from rest_framework import status

from django.db.models import Max, F

from api.libraries.stored_procedure_lib import SP
from api.helpers.common import Repeated


import json
import os


class SignUp(Repeated):
    def __init__(self):
        self.sp = SP()

    def signup_expert(self, param):
        result = self.sp.profile(param)
        return result

    def signup_cheffies(self, param):
        result = self.sp.profile(param)
        return result
    
    def signup_verify(self, param):
        result = self.sp.profile(param)
        return result