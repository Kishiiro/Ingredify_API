from django.db import models


class TSystemLogs(models.Model):
    log_id = models.BigIntegerField(primary_key=True)
    system_name = models.CharField(max_length=500, null=True, blank=True, default=None)
    system_msg = models.CharField(max_length=1000, null=True, blank=True, default=None)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.log_id
 
    class Meta:
        app_label = 'api'
        db_table = 'tsystemlogs'
        verbose_name = "System Logs" 
