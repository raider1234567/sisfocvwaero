# Generated by Django 4.1.7 on 2023-02-19 09:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("app_sisfocvwaero", "0003_alter_karyawan_divisi_id"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="karyawan",
            name="foto",
        ),
    ]
