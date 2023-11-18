from django.http import JsonResponse
from django.conf import settings

from system_settings import constant
from api.helpers.app_exception import AppException

import json
import base64
import requests


class Paymongo:
    pk = settings.PAYMONGO_PUBLIC_KEY
    sk = settings.PAYMONGO_SECRET_KEY
    environment = settings.PAYMONGO_ENV

    def __init__(self):
        pass

    def _url(self, **kwargs):
        endpoint = kwargs.get('endpoint')
        baseURL = constant.PAYMONGO_URL        
        url = F"{baseURL}/{self._endpoints()[endpoint]}" 
        return url
            
    def _endpoints(self):
        version = 'v1'
        result = {
            'merchant_payment_methods': version + '/merchants/capabilities/payment_methods',
            'create_payment': version + '/payments',
            'create_sources': version + '/sources',
            'checkout_sessions': version + '/checkout_sessions',
            'create_link': version + '/links',
            'create_customer': version + '/customers',
        }

        if hasattr(self, 'checkout_session_id') and self.checkout_session_id:
            result['expire_checkout_session'] = version + '/checkout_sessions/' + self.checkout_session_id + '/expire'
            result['retrieve_checkout_session'] = version + '/checkout_sessions/' + self.checkout_session_id

        if hasattr(self, 'link_id') and self.link_id:
            result['retrieve_link'] = version + '/links/' + self.link_id            
            result['archive_link'] = version + '/links/' + self.link_id + '/archive'           
            result['unarchive_link'] = version + '/links/' + self.link_id + '/unarchive'           

        if hasattr(self, 'reference_number') and self.reference_number:
            result['retrieve_link_by_reference'] = version + '/links?reference_number=' + self.reference_number                        

        return result

    def _http_headers(self):
        key = self.sk
        base64Encoding = "Basic " + \
            (base64.b64encode((key+':').encode('ascii'))).decode('ascii')
        http_headers = {
            'Authorization' 	: base64Encoding,
            'Content-Type'		: "application/json"
        }

        return http_headers    

    def _merchant_payment_methods(self):
        httpHeaders = self._http_headers()
        response = requests.get(self._url(endpoint='merchant_payment_methods'), headers=httpHeaders)

        return response.json()

    def _has_link_id(self, param):
        if 'link_id' not in param or not param['link_id']:
            raise AppException(400, 'link_id is required')

        self.link_id = param['link_id']        

    def _has_checkout_session_id(self, param):
        if 'checkout_session_id' not in param or not param['checkout_session_id']:
            raise AppException(400, 'checkout_session_id is required')            
        
        self.checkout_session_id = param['checkout_session_id']
    
    def create_payment(self, param):
        payload = {"data": {"attributes": {
                    "amount": param['amount'],
                    "source": {
                        "id": param['source_id'],
                        "type": param['source_type']
                    },
                    "currency": param['currency']
                }}}

        httpHeaders = self._http_headers()
        baseURL = constant.PAYMONGO_URL
        url = F"{baseURL}/{self._endpoints()['create_payment']}"
        res = requests.post(url, json=payload, headers=httpHeaders)        
        # print(f"momo:{constant.PAYMONGO_URL}")

        return res.json()
    
    def retrieve_checkout_session(self, param):
        self._has_checkout_session_id(param)
        response = requests.get(self._url(endpoint='retrieve_checkout_session'), headers=self._http_headers())

        return response.json()
    
    def expire_checkout_session(self, param):
        self._has_checkout_session_id(param)
        response = requests.post(self._url(endpoint='expire_checkout_session'), headers=self._http_headers())        

        return response.json()

    def create_checkout_sessions(self, param):
        payload = {"data": {"attributes": {
                    "line_items": param['line_items'],
                    "payment_method_types": self._merchant_payment_methods(),
                    "send_email_receipt": True,
                    "show_description": True,
                    "show_line_items": True,
                    "description": param['payment_for'],
                    "cancel_url": param['cancel_url'],
                    "success_url": param['success_url']
                }}}
        response = requests.post(self._url(endpoint='checkout_sessions'), json=payload, headers=self._http_headers())        

        return response.json()    
    
    def create_link(self, param):
        payload = {"data": {"attributes": {
                    "amount": param['amount'],
                    "description": param['description']
                }}}
        response = requests.post(self._url(endpoint='create_link'), json=payload, headers=self._http_headers())        
        return response.json()        
    
    def retrieve_link(self, param):
        self._has_link_id(param)
        response = requests.get(self._url(endpoint='retrieve_link'), headers=self._http_headers())        

        return response.json()

    def retrieve_link_by_reference(self, param):
        if 'reference_number' not in param or not param['reference_number']:
            raise AppException(400, 'reference_number is required')

        self.reference_number = param['reference_number']
        response = requests.get(self._url(endpoint='retrieve_link_by_reference'), headers=self._http_headers())        
        return response.json()

    def archive_link(self, param):
        self._has_link_id(param)
        response = requests.post(self._url(endpoint='archive_link'), headers=self._http_headers())
      
        return response.json()                    
    
    def unarchive_link(self, param):
        self._has_link_id(param)
        response = requests.post(self._url(endpoint='unarchive_link'), headers=self._http_headers())
      
        return response.json()       

    def create_customer(self, param):
        # phone eg. +639452369462
        payload = {"data": {"attributes": {
                    "first_name": param['first_name'],
                    "last_name": param['last_name'],
                    "phone": param['phone'],
                    "email": param['email'],
                    "default_device": param['default_device']
                }}}
        response = requests.post(self._url(endpoint='create_customer'), json=payload, headers=self._http_headers())        

        return response.json()                           

