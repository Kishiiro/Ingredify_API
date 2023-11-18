from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.tokens import AccessToken, RefreshToken
from rest_framework import status

from django.core.files.uploadedfile import InMemoryUploadedFile
from django.conf import settings
from api.libraries.stored_procedure_lib import SP
from system_settings.constant import NO_RECORD_FOUND
from api.helpers.app_exception import AppException

import json
import base64

class LegacyJWTAuthentication(JWTAuthentication):
    def __init__(self):
        self.user = {}
        self.stored_procedure_lib = SP()

    def authenticate(self, **param):
        result_data, context = {}, {}

        context['UserLogin'] = param.get('username')
        context['UserPassword'] = settings.DB_PREFIX + param.get('password')
        context['Flag'] = 1
        context['SPName'] = 'verifylogin' 

        result_data = self.stored_procedure_lib.profile(context)       

        if not result_data:
            raise AppException(status.HTTP_401_UNAUTHORIZED, NO_RECORD_FOUND)
        
        if not int(result_data['data'][0]['IsSuccess']):
            raise AppException(status.HTTP_401_UNAUTHORIZED, result_data['data'][0]['Result'])            

        return (result_data, None)        
    
    def check_token(self, request):
        result_data, context = {}, {}

        if request.method == 'GET':
            token = request.GET.get('useraccesstoken')
        else:
            if isinstance(request.data['useraccesstoken'], InMemoryUploadedFile):
                token = self.extract_user_access_token(request.data['useraccesstoken'])
            else:
                token = request.data['useraccesstoken']

            if not token:
                raise AppException(status.HTTP_401_UNAUTHORIZED, 'useraccesstoken is required')

            access_token = AccessToken(token)
            payload = access_token.payload

            context['ProfileID'] = payload['user_id']
            context['Flag'] = 1
            context['SPName'] = 'userlogin'

            result_data = self.stored_procedure_lib.profile(context)

            if not result_data:
                raise AppException(status.HTTP_401_UNAUTHORIZED, 'There is no returned data for user information.')

            if not int(result_data['data'][0]['IsSuccess']):
                raise AppException(status.HTTP_401_UNAUTHORIZED, 'An error occurred while retrieving user information.')

            self.user = result_data['data'][0]

        return True

   
    def extract_user_access_token(self, file):
        if not isinstance(file, InMemoryUploadedFile):
            raise ValueError('The file must be an InMemoryUploadedFile object')

        token = base64.b64encode(file.read())
        return token
