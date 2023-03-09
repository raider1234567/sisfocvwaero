from django import forms
from django.contrib.auth.forms import UserCreationForm,PasswordChangeForm, PasswordResetForm
from app_sisfocvwaero.models import *

class UserPasswordResetForm(PasswordResetForm):
    def __init__(self, *args, **kwargs):
        super(UserPasswordResetForm, self).__init__(*args, **kwargs)

    email = forms.EmailField(widget= forms.TextInput(attrs={'class': 'theme-input-style'}))

class LoginForm(forms.Form):
    username = forms.CharField(widget= forms.TextInput(attrs={'class': 'theme-input-style'}))
    password = forms.CharField(widget= forms.PasswordInput(attrs={'class': 'theme-input-style'}))

class PasswordChangesForm(PasswordChangeForm):
    old_password = forms.CharField(widget= forms.PasswordInput(attrs={'class': 'theme-input-style'}))
    new_password1 = forms.CharField(widget= forms.PasswordInput(attrs={'class': 'theme-input-style'}))
    new_password2 = forms.CharField(widget= forms.PasswordInput(attrs={'class': 'theme-input-style'}))

class RegistrationForm(UserCreationForm):
    username = forms.CharField(widget= forms.TextInput(attrs={'class': 'form-control pl-1', 'placeholder': 'Username'}))
    password1 = forms.CharField(widget= forms.PasswordInput(attrs={'class': 'form-control pl-1', 'placeholder': 'Password'}))
    password2 = forms.CharField(widget= forms.PasswordInput(attrs={'class': 'form-control pl-1', 'placeholder': 'Confirm Password'}))
    email = forms.CharField(widget= forms.EmailInput(attrs={'class': 'form-control pl-1', 'placeholder': 'Email'}))

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2', 'is_admin', 'is_karyawan', 'is_pimpinan')

class DateInput(forms.DateInput):
    input_type = "date"

class KaryawanForm(forms.ModelForm):
    jks = (('PEREMPUAN', 'PEREMPUAN'), ('LAKI-LAKI', 'LAKI-LAKI'))
    jk = forms.ChoiceField(choices=jks, widget=forms.RadioSelect)

    class Meta:
        model = Karyawan
        fields = "__all__"
        widgets = {
            'user': forms.Select(attrs={"class": "form-control pl-1"}),
            'nip': forms.TextInput(attrs={'class': 'form-control pl-1', 'placeholder': 'NIP'}),
            'nama': forms.TextInput(attrs={'class': 'form-control pl-1', 'placeholder': 'Nama Lengkap'}),
            'agama': forms.Select(attrs={"class": "form-control pl-1"}),
            'tgl_lahir': DateInput(attrs={"class": "form-control pl-1"}),
            'tmpt_lahir': forms.TextInput(attrs={'class': 'form-control pl-1', 'placeholder': 'Tempat Lahir'}),
            'pendidikan': forms.Select(attrs={"class": "form-control pl-1"}),
            'alamat': forms.TextInput(attrs={'class': 'form-control pl-1', 'placeholder': 'Alamat Sekarang'}),
            'nohp': forms.TextInput(attrs={'class': 'form-control pl-1', 'placeholder': 'No. HP'}),
            'divisi_id': forms.Select(attrs={"class": "form-control pl-1"}),
        }

class DivisiForm(forms.ModelForm):
    class Meta:
        model = Divisi
        fields = "__all__"
        widgets = {
            'divisi': forms.TextInput(attrs={"class": "form-control pl-1"}),
            'gapok': forms.NumberInput(attrs={'class': 'form-control pl-1'}),
        }

class AbsensiForm(forms.ModelForm):
    class Meta:
        model = Absensi
        fields = ('status',)
        