from rest_framework import viewsets, status
from rest_framework.response import Response

from api.helpers.authentication import LegacyJWTAuthentication
from api.libraries.community_lib import Community
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
    def SearchMeal(request):
        result_data, context = {}, {}

        try:
            menu = Community()
            auth = LegacyJWTAuthentication()

            if auth.check_token(request):
                data = json.dumps(request.data)
                context = json.loads(data)
                context['TransactBy'] = auth.user['UserLoginID']
                context['Flag'] = 2
                context['SPName'] = 'community' 

                data = menu.get_SearchMeal(context)
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
        
   