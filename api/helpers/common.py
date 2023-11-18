from django.db import models
from django.shortcuts import redirect
from django.apps import apps
from django.http import HttpResponse

import urllib.request
import socket
import uuid
import sys, requests, urllib
import random 
import calendar
import time


class Repeated:
    def __init__(self):
        pass

    def paymongo_amount_orig(self, **kwargs):
        formatted_amount = kwargs.get('amount', 0)
        amount_in_pesos = float(formatted_amount) / 100  # Convert formatted amount to pesos
        amount_in_pesos = round(amount_in_pesos, 2)  # Round the amount to 2 decimal places
        original_amount = "{:.2f}".format(amount_in_pesos)  # Format the amount with 2 decimal places

        return original_amount
    
    def paymongo_amount_format(self, **kwargs):
        subscription_amount = kwargs.get('amount', 0)
        amount_in_centavos = int(subscription_amount * 100)  # Convert amount to centavos
        amount_in_pesos = amount_in_centavos / 100  # Convert centavos to pesos
        amount_formatted = "{:.2f}".format(amount_in_pesos)  # Format amount with 2 decimal places
        amount_formatted = amount_formatted.replace(".", "")  # Remove decimal point and leading zeros

        return int(amount_formatted)
    
    def generate_code(self, str_length=10):
        random = str(uuid.uuid4())
        random = random.upper()
        random = random.replace("-","")
        return random[0:str_length]
    
    def get_current_app_name(self):
        current_app_config = apps.get_containing_app_config(type(self).__module__)
        return current_app_config.name
    
    def set_null_value(self, keys, context):
        for key in keys:
            if key not in context or context[key] is None:
                context[key] = None

    def current_time():
        t = time.localtime()
        current_time = time.strftime("%H:%M:%S", t)
        return current_time

    def send_message(self, data):
        print('Sending Message...') 
        params = (
            ('apikey', self.apikey),
            ('sendername', self.sender),
            ('message', data['message']),
            ('number', data['number'])
        )

        if data['message_type'] == 'message':
            path = 'https://semaphore.co/api/v4/messages?' + urllib.parse.urlencode(params)

        if data['message_type'] == 'otp':            
            path = 'https://semaphore.co/api/v4/otp?' + urllib.parse.urlencode(params)
        print(path)
        res = requests.post(path)
        print(res.json())
        return res.json()

    def send_sms(self, message, number):
        context = {}
        
        context['message'] = message
        context['number'] = number
        context['message_type'] = 'message'
        
        return self.send_message(context)

    def send_otp(self, message, number):
        context = {}
        
        context['message'] = message
        context['number'] = number
        context['message_type'] = 'otp'
        
        return self.send_message(context) 

    def generate_otp(self):
        key = random.randint(999,9999)
        start = random.randint(0, 9)
        end = random.randint(0, 9)
        key = str(start) + str(key) + str(end)
        return key

    def dictfetchall(cursor):
        "Return all rows from a cursor as a dict"
        columns = [col[0] for col in cursor.description]
        return [
            dict(zip(columns, row))
            for row in cursor.fetchall()
        ]  

    def cleanup_query(query): 
        try:
            # replace all single qoute delimiter to double
            query = query.replace("'", "\"")

            # replace first delimiter
            query = query.replace("\"", "'",1)

            # replace last delimiter
            s = query
            old = '"'
            new = '\''
            maxreplace = 1

            return new.join(s.rsplit(old, maxreplace))
                
        except:
            print("Unable to cleanup")                     


    def empty_to_null(value):
        return 'NULL' if value == None else value         

    def no_record():
        context = {
                 "IsSuccess" : 0
                ,"Result"  : 'No Record Found'
        }

        return context
    
    def form_method_invalid():
        context = {
                 "IsSuccess" : 0
                ,"Result"  : 'Form Method Invalid'
        }

        return context    
    
    def str_to_list(string):
        li = list(string.split(","))
        return li  
    
    def external_ip():
        external_ip = requests.get('https://checkip.amazonaws.com').text.strip()
        return external_ip
    
    def get_local_hostname_ip(output):
        try:
            host_name = socket.gethostname()
            host_ip = socket.gethostbyname(host_name)

            if output == 'host':
                return host_name

            if output == 'ip':
                return host_ip
            
        except:
            return HttpResponse("Unable to get Hostname and IP")    

    def my_random_string(string_length=10):
        """Returns a random string of length string_length."""
        random = str(uuid.uuid4()) # Convert UUID format to a Python string.
        random = random.upper() # Make all characters uppercase.
        random = random.replace("-","") # Remove the UUID '-'.
        return random[0:string_length] # Return the random string.
    
    def key_not_exists(self, key, data):
        return True if key not in data or data[key] == '' else False

    def http_message(self, code):
        if code == 200:
            message = "success"
        elif code == 204:
            message = "no content"              
        elif code == 400:
            message = "bad request"                          
        elif code == 401:
            message = "unauthorized"  
        else:      
            message = "no matching code"
        return message 

    def month_name(month_number):
        return calendar.month_name[month_number]

