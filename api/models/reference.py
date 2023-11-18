from django.db import models
from .mixins import PantryManagerModelMixin


class M_Reference(PantryManagerModelMixin):
    ReferenceID = models.BigIntegerField(primary_key=True)
    ReferenceGroup = models.CharField(max_length=100, null=True, blank=True)
    ReferenceCode = models.CharField(max_length=100, null=True, blank=True)
    ReferenceShortDescription = models.CharField(max_length=100, null=True, blank=True)
    ReferenceLongDescription = models.CharField(max_length=200, null=True, blank=True)
    ReferenceGroupCode = models.CharField(max_length=20, null=True, blank=True)
    ReferenceSequence = models.BigIntegerField(null=True, blank=True)
    
    PRIMARY_KEY_FIELD = 'ReferenceID'    

    class Meta(PantryManagerModelMixin.Meta):
        managed = False
        db_table = 'M_Reference'
        
    def __str__(self):
        return f'{self.ReferenceID}' 
    
  