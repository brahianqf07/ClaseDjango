from django.db import models

# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=150, verbose_name='Nombre', unique=True)
    desc = models.CharField(max_length=500, null=True, blank=True, verbose_name='Descripción')

    def __str__(self):
        return self.nombre
    

    class Meta:
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'
        ordering = ['id']

class Empleado(models.Model):
    categoria=models.ForeignKey(Categoria,on_delete=models.CASCADE)
    nombre=models.CharField(max_length=50,verbose_name='Nombre')
    Indentificacion=models.CharField(max_length=11,unique=True,verbose_name='identificacion')
    fecha_ingreso=models.DateTimeField(auto_now=True,verbose_name='Fecha Ingreso')
    edad=models.PositiveIntegerField(default=0,verbose_name='Edad')
    salario=models.DecimalField(default=0,decimal_places=2, max_digits=9, verbose_name='Salario')
    estado=models.BooleanField(default=True, verbose_name='Estado')
    imagen=models.ImageField(upload_to='imagen',null=True,blank=True)

    def __str__(self):
        return self.nombre
    
    class Meta:
        verbose_name='empleado'
        verbose_name_plural='Empleados'
        ordering=['id']