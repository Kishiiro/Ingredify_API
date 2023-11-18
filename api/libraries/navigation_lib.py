from rest_framework import status

from django.db.models import Max, F

from api.libraries.stored_procedure_lib import SP
from api.helpers.common import Repeated


import json
import os


class Navigation(Repeated):
    def __init__(self):
        pass

    def get_modules(self, param):
        sp = SP()
        result = []

        child = {}
        parent = sp.profile(param)

        child['SPName'] = param['SPName']
        child['Flag'] = param['Flag']
        child['UserLoginID'] = param['UserLoginID']

        for menu in parent['data']:
            child['ModuleParentID'] = menu['ModuleID']

            menu_info = {
                'ModuleParentID': menu['ModuleParentID'],
                'ParentModuleName': menu['ModuleName'],
                'name': menu['ModuleName'],
                'component': menu['ModuleName'],
                'ParentModuleController': menu['ModuleController'],
                'icon': menu['FontIcon'],
                'sub_menus': []
            }

            if menu['ModuleSubMenu'] > 0:
                sub_menu = sp.profile(child)
                for child_menu in sub_menu['data']:
                    menu_info['sub_menus'].append({
                        'name': child_menu['ModuleName'],
                        'component': child_menu['ModuleName'],
                        'ChildModuleName': child_menu['ModuleName'],
                        'ChildModuleID': child_menu['ModuleID'],
                        'ChildModuleController': child_menu['ModuleController'],
                        'icon': child_menu['FontIcon']
                    })
                

            result.append(menu_info)


        return result
