# Generated by Django 4.1.7 on 2023-02-20 02:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("app_sisfocvwaero", "0006_alter_karyawan_foto"),
    ]

    operations = [
        migrations.AlterField(
            model_name="karyawan",
            name="alamat",
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name="karyawan",
            name="foto",
            field=models.ImageField(blank=True, null=True, upload_to="uploads/"),
        ),
        migrations.AlterField(
            model_name="karyawan",
            name="nama",
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name="karyawan",
            name="nip",
            field=models.CharField(max_length=30, null=True),
        ),
        migrations.AlterField(
            model_name="karyawan",
            name="nohp",
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name="karyawan",
            name="tgl_lahir",
            field=models.DateField(null=True),
        ),
        migrations.AlterField(
            model_name="karyawan",
            name="tmpt_lahir",
            field=models.CharField(max_length=50, null=True),
        ),
    ]
