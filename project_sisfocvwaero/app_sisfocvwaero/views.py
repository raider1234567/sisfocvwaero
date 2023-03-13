import base64
import io
from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib.auth import login, authenticate, logout, update_session_auth_hash
from django.contrib import messages
from django.urls import reverse
from app_sisfocvwaero.forms import *
from app_sisfocvwaero.models import *
from app_sisfocvwaero.utils import get_geo, get_ip_user
from django.contrib.auth.decorators import login_required
from django.contrib.gis.geoip2 import GeoIP2
from geopy.geocoders import Nominatim
from geopy.distance import geodesic
from datetime import datetime, timedelta
from PIL import Image
import folium
import cv2
import numpy as np

from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.core.files import File
# Create your views here.
@login_required
def ganti_password(request):
    if request.method == 'POST':
        form = PasswordChangesForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.success(request, "Berhasil ganti password!")
            return redirect('home')
        else:
            messages.error(request, "Gagal ganti password!")
    else:
        form = PasswordChangesForm(request.user)
    return render(request, "registration/ganti_password.html", {'form': form})

# def reset_password(request):
#     form = PasswordResetForms(request.user, request.POST)
#     return render(request, "registration/password_reset_form.html", {'form': form})

@login_required
def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form = form.save()
            messages.success(request, "Pendaftaran berhasil")
            return redirect('data_karyawan_create')
        else:
            messages.error(request, "Pendaftaran gagal")
    else:
        form = RegistrationForm
    return render(request, "data_karyawan/register.html", {"form": form})

def login_view(request):
    form = LoginForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('home')
            else:
                messages.error(request, "Gagal login!")
        else:
            messages.error(request, "Error Validation!")
    return render(request, "registration/login.html", {"form": form})

@login_required
def logout_view(request):
    logout(request)
    return redirect('loginn')


@login_required
def home(request):
    return render(request, "home.html")


@login_required
def data_karyawan(request): 
    form = Karyawan.objects.order_by('-id') # select * from ORDER BY DESCENDING
    return render(request, "data_karyawan/index.html", {'form': form})


@login_required
def data_karyawan_create(request):
    if request.method == 'POST':
        form = KaryawanForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                messages.success(request, "Data berhasil ditambahkan")
                return redirect('data_karyawan')
            except:
                pass
    else:
        form = KaryawanForm()
    return render(request, "data_karyawan/create.html", {'form': form})

@login_required
def data_karyawan_edit(request, id):
    karyawan = Karyawan.objects.get(id=id)
    ar_divisi = Divisi.objects.all()
    ar_user = User.objects.all()
    if request.method == 'POST':
        form = KaryawanForm(request.POST, request.FILES, instance=karyawan)
        print(form.errors)

        if form.is_valid():
            form.save()
            messages.success(request, "Data berhasil diedit")
            return redirect('data_karyawan')
    else:
        form = KaryawanForm()
    return render(request, "data_karyawan/edit.html", {'karyawan': karyawan, 'form': form, 'ar_divisi': ar_divisi, 'ar_user': ar_user})


@login_required
def data_karyawan_delete(request, id):
    #ini hapus berdasarkan karyawan
    # form = Karyawan.objects.get(id=id)
    # form.delete()
    # messages.success(request, "Data berhasil dihapus!")
    # return redirect('data_karyawan')

    #ini hapus berdasarkan user
    form = User.objects.get(id=id)
    form.delete()
    messages.success(request, "Data berhasil dihapus!")
    return redirect('data_karyawan')


@login_required
def data_divisi(request):
    form = Divisi.objects.all()  # select * from
    return render(request, "data_divisi/index.html", {'form': form})

@login_required
def data_divisi_edit(request, id):
    divisi = Divisi.objects.get(id=id)
    if request.method == 'POST':
        form = DivisiForm(request.POST, instance=divisi)
        print(form.errors)

        if form.is_valid():
            form.save()
            messages.success(request, "Data berhasil diedit")
            return redirect('data_divisi')
    else:
        form = DivisiForm()
    return render(request, "data_divisi/edit.html", {'form': form, 'divisi': divisi})

@login_required
def data_profil(request, id):
    karyawan = Karyawan.objects.get(user_id=id)
    ar_divisi = Divisi.objects.all()
    ar_user = User.objects.all()
    if request.method == 'POST':
        form = KaryawanForm(request.POST, request.FILES, instance=karyawan)
        print(form.errors)

        if form.is_valid():
            form.save()
            messages.success(request, "Data berhasil diedit")
            return redirect('data_profil')
    else:
        form = KaryawanForm()
    return render(request, "data_profil/index.html", {'karyawan': karyawan, 'form': form, 'ar_divisi': ar_divisi, 'ar_user': ar_user})

@login_required
def absensi(request, id):
    absensi = Absensi.objects.filter(user_id=id).order_by('-id')
    return render(request, "absensi/index.html", {'absensi': absensi})

@login_required
def absensi_masuk(request):
    return render(request, "absensi_masuk/index.html")

@login_required
def absensi_keluar(request, id):
    absensi = Absensi.objects.filter(user_id=id).latest('id')
    return render(request, "absensi_keluar/index.html",{'absensi': absensi})

@login_required
def deteksi_wajah_keluar(request, id):
   #lokasi

    geolocator = Nominatim(user_agent="app_sisfocvwaero")

    #get user location
    user_ip = get_ip_user(request)#ip user tapi masih localhost
    print(user_ip)
    user_ip_ = "140.213.74.94" #ip user sementara #ip makassar 140.213.74.94
    lat, lon = get_geo(user_ip_)

    user_lat = lat
    user_lon = lon
    location_user = (user_lat, user_lon)

    location_user_ = geolocator.reverse(location_user)
    print("address user = ", location_user_.address)

    #get office location

    #lat dan lon lazuna = -5.136449682997404, 119.4825501453872
    #lat dan lon cv.waero = -5.222915548660268, 119.48697360058289

    kantor_lat = "-5.136449682997404"
    kantor_lon = "119.4825501453872"
    location_kantor = (kantor_lat, kantor_lon)

    location_kantor_ = geolocator.reverse(location_kantor)
    print(location_kantor_.address)
    # print(location_kantor.latitude, location_kantor.longitude)

    # get distance / hitung jarak
    distance = round(geodesic(location_user, location_kantor). km, 2)
    print("jaraknya adalah ",distance)

    #inisialisasi folium
    # m = folium.Map(width=800, height=500, location=location_user) # untuk tambah map
    # m = m._repr_html_()

    #get time now
    current_time = datetime.now().strftime('%H:%M:%S')
    print("jam sekarang = ", current_time)

    #get user id logged
    id_user = request.user.id

    #face detection
    cap = cv2.VideoCapture(0)

    while True:
        ret, frame = cap.read()

        face_cascade = cv2.CascadeClassifier('E:/skripsi/program/new_sisfocvwaero/project_sisfocvwaero/app_sisfocvwaero/face.xml')
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)

        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)
            cv2.putText(frame, str("OK"), (x+40, y-10), cv2.FONT_HERSHEY_DUPLEX, 1, (0, 255, 0))

        cv2.imshow('frame', frame)
        # img = cv2.imwrite('Frame'+str(i)+'.jpg', frame)

        # Check if the video capture device was successfully opened
        if not cap.isOpened():
            print("Failed to open video capture device")
            return

        # Check if the frame was successfully read
        if not ret:
            print("Failed to read frame from video capture device")
            return

        # Convert the frame to a JPEG image buffer
        success, jpeg_image = cv2.imencode('.jpg', frame)
        if not success:
            print("Failed to encode image as JPEG")
            return
        
        absensi = Absensi.objects.get(id=id)

        key = cv2.waitKey(1)
        if key == ord('s'):
            # cv2.imwrite(filename='saved_img.jpg', img=frame)
            form = AbsensiForm(request.POST, request.FILES, instance=absensi)
            # pengkondisian jarak
            if distance < 6 :
                if form.is_valid():
                    instance = form.save(commit=False)
                    instance.absen_keluar = current_time
                    #pengkondisian waktu
                    if current_time < '17:00:00':
                        instance.ket_keluar = "TEPAT_WAKTU"
                    else:
                        instance.ket_keluar = "LEMBUR"
                        jam_pulang = '17:00:00'
                        t1 = datetime.strptime(current_time, '%H:%M:%S')
                        t2 = datetime.strptime(jam_pulang, '%H:%M:%S')
                        t3 = abs(t1 - t2)
                        jam = t3.total_seconds() / 3600
                        total_jam = round(jam, 2)
                        instance.jml_jamlembur = total_jam
                        print("jam lembur ", total_jam)

                    status_ = form.cleaned_data.get('status')
                    instance.status = status_
                    img_data = BytesIO(jpeg_image.tobytes())
                    img_file = File(img_data)
                    img_file.name = 'image.jpg'
                    instance.image_keluar = img_file
                    instance.save()
                    print("success save")
                print(form.errors)  
            else:
                    messages.warning(request, "Anda berada diluar jangkauan kantor")
                    return redirect('absensi_masuk')
            break

    cap.release()
    cv2.destroyAllWindows()

    return redirect(reverse("absensi", args=[id_user]), {'absensi': absensi})

@login_required
def sakit(request,):
    if request.method == 'POST':
        form = SakitForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                messages.success(request, "Data berhasil ditambahkan")
                return redirect('absensi')
            except:
                pass
    else:
        form = SakitForm()
    return render(request, "absensi_masuk/sakit.html", {'form': form})

@login_required
def hadir(request):
    return render(request, "absensi_masuk/hadir.html")


@login_required
def deteksi_wajah(request):
    #lokasi

    geolocator = Nominatim(user_agent="app_sisfocvwaero")

    #get user location
    user_ip = get_ip_user(request)#ip user tapi masih localhost
    print(user_ip)
    user_ip_ = "140.213.74.94" #ip user sementara #ip makassar 140.213.74.94
    lat, lon = get_geo(user_ip_)

    user_lat = lat
    user_lon = lon
    location_user = (user_lat, user_lon)

    location_user_ = geolocator.reverse(location_user)
    print("address user = ", location_user_.address)

    #get office location

    #lat dan lon lazuna = -5.136449682997404, 119.4825501453872
    #lat dan lon cv.waero = -5.222915548660268, 119.48697360058289

    kantor_lat = "-5.136449682997404"
    kantor_lon = "119.4825501453872"
    location_kantor = (kantor_lat, kantor_lon)

    location_kantor_ = geolocator.reverse(location_kantor)
    print(location_kantor_.address)
    # print(location_kantor.latitude, location_kantor.longitude)

    # get distance / hitung jarak
    distance = round(geodesic(location_user, location_kantor). km, 2)
    print("jaraknya adalah ",distance)

    #inisialisasi folium
    # m = folium.Map(width=800, height=500, location=location_user) # untuk tambah map
    # m = m._repr_html_()

    #get time now
    current_time = datetime.now().strftime('%H:%M:%S')
    print("jam sekarang = ", current_time)

    #get user id logged
    id_user = request.user.id

    #face detection
    cap = cv2.VideoCapture(0)

    while True:
        ret, frame = cap.read()

        face_cascade = cv2.CascadeClassifier('E:/skripsi/program/new_sisfocvwaero/project_sisfocvwaero/app_sisfocvwaero/face.xml')
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)

        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)
            cv2.putText(frame, str("OK"), (x+40, y-10), cv2.FONT_HERSHEY_DUPLEX, 1, (0, 255, 0))

        cv2.imshow('frame', frame)
        # img = cv2.imwrite('Frame'+str(i)+'.jpg', frame)

        # Check if the video capture device was successfully opened
        if not cap.isOpened():
            print("Failed to open video capture device")
            return

        # Check if the frame was successfully read
        if not ret:
            print("Failed to read frame from video capture device")
            return

        # Convert the frame to a JPEG image buffer
        success, jpeg_image = cv2.imencode('.jpg', frame)
        if not success:
            print("Failed to encode image as JPEG")
            return
        
        key = cv2.waitKey(1)
        if key == ord('s'):
            # cv2.imwrite(filename='saved_img.jpg', img=frame)
            form = AbsensiForm(request.POST, request.FILES)
            # pengkondisian jarak
            if distance < 6 :
                if form.is_valid():
                    instance = form.save(commit=False)
                    instance.user_id = id_user
                    instance.absen_masuk = current_time

                    #pengkondisian waktu
                    if current_time < '08:00:00':
                        instance.ket_masuk = "TEPAT_WAKTU"
                    else:
                        instance.ket_masuk = "TELAT"

                    instance.ket_keluar = "-"
                    status_ = form.cleaned_data.get('status')
                    instance.status = status_
                    img_data = BytesIO(jpeg_image.tobytes())
                    img_file = File(img_data)
                    img_file.name = 'image.jpg'
                    instance.image_masuk = img_file
                    instance.save()
                    print("success save")
                print(form.errors)  
            else:
                    messages.warning(request, "Anda berada diluar jangkauan kantor")
                    return redirect('absensi_masuk')
            break

    cap.release()
    cv2.destroyAllWindows()

    return redirect(reverse("absensi", args=[id_user]))


