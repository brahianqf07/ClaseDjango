from django.shortcuts import render
from app.models import Categoria,Empleado

# Create your views here.

def myfirstview(request):
    data={'Ficha': '2921881',
    'Categoria': Categoria.objects.all()}
    return render(request,'indexa.html',data)

def mysecondview(request):
    data={'Ficha': '2921881',
    'Empleado': Empleado.objects.all()}
    return render(request,'empleados.html',data)

def myThirdView(request):
    return render(request, 'index.html')