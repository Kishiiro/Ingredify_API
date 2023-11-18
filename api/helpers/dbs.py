from django.db import connections
from django.http import JsonResponse

from api.helpers.common import Repeated

import json


class DB():
    def __init__(self):
        pass
    
    def profiles(self, param):
        try:
            query = "CALL sp_" + param["SPName"] + "(@ReturnIsSuccess, %s)"  # Use parameterized query
            params = (json.dumps(param),)  # Convert param dictionary to JSON string
            print("Query:", query % params)
            with connections['default'].cursor() as cursor:
                cursor.execute(Repeated.cleanup_query(query), params)
                row = Repeated.dictfetchall(cursor)
                cursor.close()

            return row
        except Exception as ex:
            return JsonResponse(str(ex), safe=False)

                 
      
        



