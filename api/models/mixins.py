from django.db import models
from django.db.models import Max
from .base import AbstractBaseModel

class PantryManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().using('default')

class PantryManagerModelMixin(AbstractBaseModel):
    objects = PantryManager()

    class Meta(AbstractBaseModel.Meta):
        abstract = True

    def _objects(self):
        return self.__class__.objects

    def save(self, *args, **kwargs):
        max_id_attr = getattr(self, 'PRIMARY_KEY_FIELD', 'id')  # Defaulting to 'id' if not specified
        if not getattr(self, max_id_attr):
            max_id = self._objects().aggregate(max_id=Max(max_id_attr))['max_id'] or 0
            setattr(self, max_id_attr, max_id + 1)
        kwargs["using"] = "default"  # This is still useful for explicit clarity
        super().save(*args, **kwargs)
