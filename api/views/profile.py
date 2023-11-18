from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser

from api.libraries.profile_lib import Profile
from api.helpers.authentication import LegacyJWTAuthentication
from api.helpers.app_exception import AppException


import json

class Transact(viewsets.ViewSet):
    parser_classes = (MultiPartParser, FormParser) 

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.profile_lib = Profile()
        self.authentication = LegacyJWTAuthentication()

    def upload_photo(self, request):
             
        try:
            result_data= {}

            if self.authentication.check_token(request):
                result_data['code'] = status.HTTP_200_OK
                result_data['data'] = self.profile_lib.upload_photo(request)
                return Response(result_data, status=status.HTTP_200_OK)       
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_500_INTERNAL_SERVER_ERROR,
                'message' : str(e)
                }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)   
    
    def ProfileUser(self, request):
        result_data, context = {}, {}

        try:
            if self.authentication.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = self.authentication.user['UserLoginID']
                context['Flag'] = 3
                context['SPName'] = 'profile' 

                data = self.profile_lib.get_ProfileUser(context)
                result_data = data
                return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_500_INTERNAL_SERVER_ERROR,
                'message' : str(e)
                }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)  

    def ProfileUpdateName(self, request):
        result_data, context = {}, {}

        try:
            if self.authentication.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = self.authentication.user['UserLoginID']
                context['Flag'] = 4
                context['SPName'] = 'profile' 
                
                data = self.profile_lib.post_UpdateProfileName(context)
                result_data = data
                
                return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_500_INTERNAL_SERVER_ERROR,
                'message' : str(e)
                }, status=status.HTTP_500_INTERNAL_SERVER_ERROR) 
    
    def ProfileUpdatePassword(self, request):
        result_data, context = {}, {}

        try:
            if self.authentication.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = self.authentication.user['UserLoginID']
                context['Flag'] = 3
                context['SPName'] = 'userlogin' 
                
                data = self.profile_lib.post_ChangeProfilePassword(context)
                result_data = data
                return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_500_INTERNAL_SERVER_ERROR,
                'message' : str(e)
                }, status=status.HTTP_500_INTERNAL_SERVER_ERROR) 

    def ProfileComorbidity(self, request):
        result_data, context = {}, {}

        try:
            if self.authentication.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = self.authentication.user['UserLoginID']
                context['Flag'] = 2
                context['SPName'] = 'cheffies' 

                data = self.profile_lib.get_ProfileCormobidity(context)
                result_data = data
                return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_500_INTERNAL_SERVER_ERROR,
                'message' : str(e)
                }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)  
   
    def ProfileRestrictions(self, request):
        result_data, context = {}, {}

        try:
            if self.authentication.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = self.authentication.user['UserLoginID']
                context['Flag'] = 1
                context['SPName'] = 'restrictions' 

                data = self.profile_lib.get_ProfileRestrictions(context)
                result_data = data
                return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_500_INTERNAL_SERVER_ERROR,
                'message' : str(e)
                }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)  
