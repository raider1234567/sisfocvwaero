# Generated by Django 4.1.7 on 2023-02-19 09:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("app_sisfocvwaero", "0004_remove_karyawan_foto"),
    ]

    operations = [
        migrations.AddField(
            model_name="karyawan",
            name="foto",
            field=models.ImageField(null=True, upload_to=""),
        ),
    ]
