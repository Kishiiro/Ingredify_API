from django.db import models
from .mixins import PantryManagerModelMixin
from .reference import M_Reference

class M_Profile(PantryManagerModelMixin):
    ProfileID = models.BigIntegerField(primary_key=True)    
    ProfileFirstName = models.CharField(max_length=200, null=True, blank=True)
    ProfileMiddleName = models.CharField(max_length=200, null=True, blank=True)
    ProfileLastName = models.CharField(max_length=200, null=True, blank=True)
    ProfileExtName = models.CharField(max_length=5, null=True, blank=True)
    ProfileBirthdate = models.DateField(null=True, blank=True)
    ProfileAddress = models.TextField(null=True, blank=True)
    ProfileContactNo = models.CharField(max_length=20, null=True, blank=True)
    ProfilePic = models.ImageField(upload_to='photos/')
    ProfileEmail = models.CharField(max_length=500, null=True, blank=True)
    ReferenceGenderID = models.ForeignKey(M_Reference, on_delete=models.CASCADE, 
                                              db_constraint=False, db_column='ReferenceGenderID') 

    PRIMARY_KEY_FIELD = 'ProfileID'

    class Meta(PantryManagerModelMixin.Meta):
        managed = False
        db_table = 'M_Profile'

    def __str__(self):
        return f'{self.ProfileID}'              
    

