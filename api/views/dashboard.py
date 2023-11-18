from rest_framework import viewsets, status
from rest_framework.response import Response

from api.helpers.authentication import LegacyJWTAuthentication
from api.libraries.dashboard_lib import Dashboard
from api.helpers.app_exception import AppException

import json
import datetime


class Transact(viewsets.ViewSet):

    '''
        Author: 
        Date Created: 
        Purpose: search recipe
    '''    
    @staticmethod
    def SearchRecipe(request):
        result_data, context = {}, {}

        try:
            menu = Dashboard()
            auth = LegacyJWTAuthentication()

            if auth.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = auth.user['UserLoginID']
                context['Flag'] = 3
                context['SPName'] = 'recipe' 

                data = menu.get_SearchRecipe(context)
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
        
    @staticmethod
    def AllRecipe(request):
        result_data, context = {}, {}

        try:
            menu = Dashboard()
            auth = LegacyJWTAuthentication()

            if auth.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = auth.user['UserLoginID']
                context['Flag'] = 1
                context['SPName'] = 'recipe' 
                
                data = menu.get_allrecipe(context)
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

    @staticmethod
    def ProfileUser(request):
        result_data, context = {}, {}

        try:
            menu = Dashboard()
            auth = LegacyJWTAuthentication()

            # if auth.check_token(request):
            data = json.dumps(request.data)
            context = json.loads(data)
            context['TransactBy'] = auth.user['UserLoginID']
            context['Flag'] = 3
            context['SPName'] = 'profile' 

            data = menu.get_ProfileUser(context)
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