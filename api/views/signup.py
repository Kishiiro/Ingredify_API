from rest_framework import viewsets, status
from rest_framework.response import Response

from api.helpers.authentication import LegacyJWTAuthentication
from api.libraries.signup_lib import SignUp
from api.helpers.app_exception import AppException

import json
import datetime


class Transact(viewsets.ViewSet):

    '''
        Author: 
        Date Created: 
        Purpose: expert signup 
    '''    
    @staticmethod
    def expert(request):
        result_data, context = {}, {}

        try:
            menu = SignUp()

            data = json.dumps(request.data)
            context = json.loads(data)
            context['Flag'] = 1
            context['SPName'] = 'profile' 

            data = menu.signup_expert(context)
            result_data = data
            return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_401_UNAUTHORIZED,
                'message' : str(e)
                }, status=status.HTTP_401_UNAUTHORIZED)   
        
    '''
        Author: 
        Date Created: 
        Purpose: cheffies signup 
    '''    
    @staticmethod
    def cheffies(request):
        result_data, context = {}, {}

        try:
            menu = SignUp()

            data = json.dumps(request.data)
            context = json.loads(data)
            context['Flag'] = 2
            context['SPName'] = 'profile' 

            data = menu.signup_cheffies(context)
            result_data = data
            return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_401_UNAUTHORIZED,
                'message' : str(e)
                }, status=status.HTTP_401_UNAUTHORIZED)   
        
    '''
        Author: 
        Date Created: 
        Purpose: expert verify 
    '''    
    @staticmethod
    def verify(request):
        result_data, context = {}, {}

        try:
            menu = SignUp()
            auth = LegacyJWTAuthentication()

            if auth.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = auth.user['UserLoginID']
                context['Flag'] = 2
                context['SPName'] = 'experts' 
                
                data = menu.signup_verify(context)
                result_data = data
                return Response(result_data, status=status.HTTP_200_OK)  
        except AppException as e:
            return Response({
                'code' : e.code,
                'message' : e.message
                }, status=e.code) 
        except Exception as e:
            return Response({
                'code' : status.HTTP_401_UNAUTHORIZED,
                'message' : str(e)
                }, status=status.HTTP_401_UNAUTHORIZED) 