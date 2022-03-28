from django.db import models

# Create your models here.

class user(models.Model):
    name=models.CharField(max_length=100, default='')
    username=models.CharField(max_length=100, default='')
    email=models.CharField( max_length=100, default='')
    password=models.CharField(max_length=32, default='')
    phone=models.CharField(max_length=32, default='')
    image=models.ImageField(upload_to='images',default='')
    authN=models.CharField(max_length=100, default='')

	
class seller(models.Model):
    vname=models.CharField(max_length=100, default='')
    username=models.CharField(max_length=100, default='')
    email=models.CharField( max_length=100, default='')
    password=models.CharField(max_length=32, default='')
    phone=models.CharField(max_length=32, default='')
    image=models.ImageField(upload_to='images',default='')
    authN=models.CharField(max_length=100, default='')

class product(models.Model):
     productname=models.CharField(max_length=100, default='')
     productprice=models.CharField(max_length=100, default='')
     productdes=models.CharField(max_length=500, default='')
     sellerid =models.ForeignKey(seller, on_delete=models.CASCADE)
     pimage=models.ImageField(upload_to='images',default='')
     brand=models.CharField(max_length=100, default='')
     condition=models.CharField(max_length=100, default='')

class booking(models.Model):
     bookingdatefrom=models.DateField(max_length=100, default='')
     bookingdateto=models.DateField(max_length=100, default='')
     productid=models.ForeignKey(product, on_delete=models.CASCADE)
     bookeduser=models.ForeignKey(user, on_delete=models.CASCADE)
     sellerid =models.ForeignKey(seller, on_delete=models.CASCADE)
     status =models.CharField(max_length=100, default='')
     amount =models.CharField(max_length=100, default='')
    
