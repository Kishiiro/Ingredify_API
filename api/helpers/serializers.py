from rest_framework import serializers
from api.models.pantry import TSystemLogs
from api.models.profile import M_Profile

class TRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = TSystemLogs
        fields = '__all__' 

class ProfilePhotoSerializer(serializers.ModelSerializer):
    class Meta:
        model = M_Profile
        fields = ['ProfilePic'] 