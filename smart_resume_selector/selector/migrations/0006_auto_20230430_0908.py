# Generated by Django 3.2.18 on 2023-04-30 03:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('selector', '0005_applied_predicted_score'),
    ]

    operations = [
        migrations.AddField(
            model_name='applied',
            name='status',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='vacancy',
            name='experiance',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]
