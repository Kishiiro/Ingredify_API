from rest_framework import status

from django.db.models import Max, F

from api.libraries.stored_procedure_lib import SP
from api.helpers.common import Repeated


import json
import os


class Dashboard(Repeated):
    def __init__(self):
        self.sp = SP()

    def get_SearchRecipe(self, param):
        result = self.sp.profile(param)
        return result

    def get_allrecipe(self, param):
        result = self.sp.profile(param)
        return result
    def get_ProfileUser(self, param):
        result = self.sp.profile(param)
        return result
