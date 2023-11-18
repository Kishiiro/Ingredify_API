from django.db import models

class AbstractBaseModel(models.Model):
    ReferenceTableStatusID = models.BigIntegerField(default=1)
    DateAdded = models.DateTimeField(auto_now_add=True)
    AddedbyUserLoginID = models.BigIntegerField(default=999999)
    DateUpdated = models.DateTimeField(null=True, blank=True)
    UpdatedbyUserLoginID = models.BigIntegerField(null=True, blank=True)

    class Meta:
        abstract = True
