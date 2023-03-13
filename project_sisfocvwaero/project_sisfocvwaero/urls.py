"""project_sisfocvwaero URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from app_sisfocvwaero.views import *
from app_sisfocvwaero.forms import *
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

urlpatterns = [
    path("admin/", admin.site.urls),
    path("home/", home, name="home"),
    path("home/ganti_password/", ganti_password, name="ganti_password"),
    path("home/data_profil/<int:id>/", data_profil, name="data_profil"),
    path("home/data_divisi/", data_divisi, name="data_divisi"),
    path("home/data_divisi/edit/<int:id>/", data_divisi_edit, name="data_divisi_edit"),
    path("home/data_karyawan/", data_karyawan, name="data_karyawan"),
    path("home/data_karyawan/edit/<int:id>/", data_karyawan_edit, name="data_karyawan_edit"),
    path("home/data_karyawan/delete/<int:id>/", data_karyawan_delete, name="data_karyawan_delete"),
    path("home/data_karyawan/register/", register, name="data_karyawan_register"),
    path("home/data_karyawan/register/create/", data_karyawan_create, name="data_karyawan_create"),
    path("home/absensi/<int:id>/", absensi, name="absensi"),
    path("home/absensi_keluar/<int:id>/", absensi_keluar, name="absensi_keluar"),
    path("home/absensi_keluar/deteksi_wajah/<int:id>/", deteksi_wajah_keluar, name="deteksi_wajah_keluar"),
    path("home/absensi_masuk/", absensi_masuk, name="absensi_masuk"),
    path("home/absensi_masuk/sakit/", sakit, name="sakit"),
    path("home/absensi_masuk/hadir/", hadir, name="hadir"),
    path("home/absensi_masuk/hadir/deteksi_wajah", deteksi_wajah, name="deteksi_wajah"),
    path("signup/", register, name="registrasi"),
    path("login/", login_view, name="loginn"),
    path("logout/", logout_view, name="logoutt"),
    path("reset_password/", auth_views.PasswordResetView.as_view(template_name='registration/reset_password.html', form_class=UserPasswordResetForm),name='reset_password'),
    path("reset_password_send/", auth_views.PasswordResetDoneView.as_view(template_name='registration/password_reset_send.html'), name='password_reset_done'),
    path("reset/<uidb64>/<token>/", auth_views.PasswordResetConfirmView.as_view(template_name='registration/password_reset_form.html'),name='password_reset_confirm'),
    path("reset_password_complete/", auth_views.PasswordResetCompleteView.as_view(template_name='registration/password_reset_done.html'),name='password_reset_complete'),
    # path("accounts/", include('django.contrib.auth.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

