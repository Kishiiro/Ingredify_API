from rest_framework import status

from django.db.models import Max, F

from api.libraries.stored_procedure_lib import SP
from api.helpers.common import Repeated

from api.helpers.serializers import ProfilePhotoSerializer
from api.models.profile import M_Profile
from api.helpers.app_exception import AppException

import json
import os


class Profile(Repeated):
    def __init__(self):
        self.sp = SP()

    def get_ProfileUser(self, param):
        result = self.sp.profile(param)
        return result
        
    def post_UpdateProfileName(self, param):
        result = self.sp.profile(param)
        return result

    def post_ChangeProfilePassword(self, param):
        result = self.sp.profile(param)
        return result
    
    def get_ProfileComorbidity(self, param):
        result = self.sp.profile(param)
        return result

    def get_ProfileRestrictions(self, param):
        result = self.sp.profile(param)
        return result  
        
    def _objects(self, model_class):
        return model_class.objects.using('default')        

    def upload_photo(self, param):
        result = {}
        profile_id = param.data.get('ProfileID')  

        if not profile_id:
            raise AppException(status.HTTP_400_BAD_REQUEST, 'ProfileID is required') 
        
        profile = self._objects(M_Profile).get(ProfileID=profile_id)
        serializer = ProfilePhotoSerializer(profile, data=param.data)

        if serializer.is_valid():
            serializer.save()

            result['ProfileID'] = profile_id
            result['ProfilePicUrl'] = serializer.data['ProfilePic']
            return result
        else:
            raise AppException(status.HTTP_400_BAD_REQUEST, serializer.errors)

