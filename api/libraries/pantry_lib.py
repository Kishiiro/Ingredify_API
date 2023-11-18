from rest_framework import status

from django.db.models import Max, F

from api.libraries.stored_procedure_lib import SP
from api.helpers.common import Repeated


import json
import os


class Pantry(Repeated):
    def __init__(self):
        self.sp = SP()

    def post_SearchIngredients(self, param):
        result = self.sp.profile(param)
        return result

    def post_SearchMeal(self, param):
        result = self.sp.profile(param)
        return result

    def post_CreateMeal(self, param):
        result = self.sp.profile(param)
        return result
