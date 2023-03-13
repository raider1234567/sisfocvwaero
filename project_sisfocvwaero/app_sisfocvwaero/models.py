from io import BytesIO
from PIL import Image
from django.core.files.base import ContentFile
from django.db import models
from django.contrib.auth.models import AbstractUser, User


# Create your models here.
pendidikan = [
    ('STRATA 2', 'STRATA 2'),
    ('STRATA 1', 'STRATA 1'),
    ('SMA/SMK/SEDERAJAT', 'SMA/SMK/SEDERAJAT'),
    ('SMP/MTS/SEDERAJAT', 'SMP/MTS/SEDERAJAT'),
]

level = [
    ('PIMPINAN', 'PIMPINAN'),
    ('MANAGER', 'MANAGER'),
    ('KARYAWAN', 'KARYAWAN'),
    ('ADMIN', 'ADMIN')
]

status = [
    ('HADIR', 'HADIR'),
    ('TIDAK HADIR', 'TIDAK HADIR')
]

agama = [
    ('ISLAM', 'ISLAM'),
    ('PROTESTAN', 'PROTESTAN'),
    ('KATOLIK', 'KATOLIK'),
    ('HINDU', 'HINDU'),
    ('BUDHA', 'BUDHA')
]

class User(AbstractUser):
    is_admin = models.BooleanField(default=False)
    is_karyawan = models.BooleanField(default=False)
    is_pimpinan = models.BooleanField(default=False)

class Divisi(models.Model):
    divisi = models.CharField(max_length=30)
    gapok = models.IntegerField(default=0)

    def __str__(self):
        return self.divisi
    
class Karyawan(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    nip = models.CharField(max_length=30, null=True)
    nama = models.CharField(max_length=50, null=True)
    jk = models.CharField(max_length=30, null=True)
    agama = models.CharField(max_length=30, choices=agama, null=True)
    tgl_lahir = models.DateField(null=True)
    tmpt_lahir = models.CharField(max_length=50, null=True)
    pendidikan = models.CharField(max_length=30, choices=pendidikan, null=True)
    alamat = models.CharField(max_length=50, null=True)
    nohp = models.CharField(max_length=50, null=True)
    foto = models.ImageField(upload_to='uploads/', null=True, blank=False)
    divisi_id = models.ForeignKey(Divisi, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.nama
    
class Absensi(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    image_masuk = models.ImageField(upload_to='image_masuk/', null=True, blank=False)
    image_keluar = models.ImageField(upload_to='image_keluar/', null=True, blank=False)
    tanggal = models.DateField(auto_now_add=True)
    absen_masuk = models.TimeField(null=True)
    ket_masuk = models.CharField(max_length=30, null=True)
    absen_keluar = models.TimeField(null=True)
    ket_keluar = models.CharField(max_length=30, null=True)
    status = models.CharField(max_length=30)
    jml_jamlembur = models.IntegerField(null=True)

    def __str__(self):
        return f"lokasi = {self.location}, kantor {self.location} dan jarak = {self.distance}"
    
class Gambar(models.Model):
    image = models.ImageField(upload_to='captures')
    date = models.DateTimeField(auto_now_add=True)

class Sakit(models.Model):
    absensi = models.ForeignKey(Absensi, on_delete=models.CASCADE, null=True)
    keterangan = models.CharField(max_length=100, null=True)
    foto = models.ImageField(upload_to='sakit/', null=True)
