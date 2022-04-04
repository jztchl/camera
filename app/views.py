from ast import Return
from http.client import HTTPResponse
import re
from time import strftime
from django.shortcuts import render
from app.models import *
from django.http import HttpResponseRedirect, JsonResponse
from genericpath import exists
import os
from datetime import *
from django.contrib.auth.models import User
from django.conf import settings
from django.core.mail import send_mail,EmailMultiAlternatives
import hashlib
from cryptography.fernet import Fernet

def  crypenc(word):
    key='8kFlNXBwK5iMiviWIjG9A13g3h6xhoSqU2mWcddkQSY='
    fernet=Fernet(key)
    encword=fernet.encrypt(word.encode())
    encword=encword.decode()
    return encword

def crypdec(word):
    key='8kFlNXBwK5iMiviWIjG9A13g3h6xhoSqU2mWcddkQSY='
    fernet=Fernet(key)
    word=word.encode()
    decword=fernet.decrypt(word).decode()
    return decword
    

def index(request):
    return render(request, 'index.html')

def usercheck(request):
    use = request.GET.get('p')
    ema = request.GET.get('q')
    b = user.objects.filter(username=use).exists()
    c = user.objects.filter(email=ema).exists()
    if b & c:
        ej = "t"
        fj = "t"
        jj = {"vv": ej, "ww": fj}
        return JsonResponse(jj)
    if b:
        ej = "t"
        jj = {"vv": ej}
        return JsonResponse(jj)
    if c:
        fj = "t"
        ll = {"ww": fj}
        return JsonResponse(ll)

def userregistration(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        phone = request.POST['phone-number']
        password = request.POST['password']
        username = request.POST['username']
        image = request.FILES['img']
        print(name)
        password=hashlib.md5(password.encode('utf8')).hexdigest()
        b = user(name=name, email=email, phone=phone,
                 password=password, username=username, image=image, authN="pending")
        b.save()
        word=crypenc(username)
        subject = 'Email Verification'
        message = f'Hi {name}, please click here to verify your email link: http://100.25.1.169/userverification/?uid={word} '
        email_from = settings.EMAIL_HOST_USER 
        recipient_list = [email, ] 
        send_mail( subject, message, email_from, recipient_list ) 
        return render(request, 'userregistration.html', {"ms": "successfully registered ,Please Verify Email"})
    else:
        return render(request, 'userregistration.html')
    
def userverification(request):
    use = request.GET['uid']
    use=crypdec(use)
    user.objects.filter(username=use).update(authN='Approved')
    return HttpResponseRedirect("/userlogin/")

def sellercheck(request):
    use = request.GET.get('p')
    ema = request.GET.get('q')
    b = seller.objects.filter(username=use).exists()
    c = seller.objects.filter(email=ema).exists()
    if b & c:
        ej = "t"
        fj = "t"
        jj = {"vv": ej, "ww": fj}
        return JsonResponse(jj)
    if b:
        ej = "t"
        jj = {"vv": ej}
        return JsonResponse(jj)
    if c:
        fj = "t"
        ll = {"ww": fj}
        return JsonResponse(ll)

def sellerregistration(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        phone = request.POST['phone-number']
        password = request.POST['password']
        username = request.POST['username']
        image = request.FILES['img']
        password=hashlib.md5(password.encode('utf8')).hexdigest()
        print(name)
        b = seller(vname=name, email=email, phone=phone,
                   password=password, username=username, image=image, authN="pending")
        b.save()
        word=crypenc(username)
        subject = 'Email Verification'
        message = f'Hi {name}, please click here to verify your email link:http://100.25.1.169/sellerverification/?sid={word} '
        email_from = settings.EMAIL_HOST_USER 
        recipient_list = [email, ] 
        send_mail( subject, message, email_from, recipient_list ) 
        return render(request, 'sellerregistration.html', {"ms": "successfully registered,Please Verify Email"})
    else:
        return render(request, 'sellerregistration.html')
    
def sellerverification(request):
    sid = request.GET['sid']
    sid=crypdec(sid)
    seller.objects.filter(username=sid).update(authN='Approved')
    return HttpResponseRedirect("/sellerlogin/")


def userlogin(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        password=hashlib.md5(password.encode('utf8')).hexdigest()
        use = user.objects.filter(username=username, password=password)
        for x in use:
            name = x.username
            pswd = x.password
            aut  = x.authN
            if username == name and password == pswd:
                if aut == 'pending':
                    return render(request, 'sellerlogin.html', {'errr': 'Please Verify your Email'})
                else:
                 request.session['use'] = x.id
                 return render(request, 'index.html', {'success': 'successfully logged in'})
        else:
            return render(request, 'userlogin.html', {'errr': 'invalid credentials'})

    else:
        return render(request, 'userlogin.html')


def sellerlogin(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        password=hashlib.md5(password.encode('utf8')).hexdigest()
        use = seller.objects.filter(username=username, password=password)
        for x in use:
            name = x.username
            pswd = x.password
            aut  = x.authN
            if username == name and password == pswd:
                if aut == 'pending':
                    return render(request, 'sellerlogin.html', {'errr': 'Please Verify Your Email'})
                else:
                 request.session['sel'] = x.id
                return render(request, 'index.html', {'success': 'successfully logged in'})
        else:
            return render(request, 'sellerlogin.html', {'errr': 'invalid credentials'})

    else:
        return render(request, 'sellerlogin.html')


def sellerlogout(request):
    if request.session.has_key('sel'):
        del request.session['sel']
    return render(request, 'index.html')


def userlogout(request):
    if request.session.has_key('use'):
        del request.session['use']
    return render(request, 'index.html')


def sellerprofile(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        phone = request.POST['phone-number']
        username = request.POST['username']
        imgup = request.POST['chh']
        if (imgup == 'yes'):
            image1 = request.FILES['image']
            oldrec = seller.objects.filter(id=sel)
            updrec = seller.objects.get(id=sel)
            for x in oldrec:
                imgurl = x.image.url
                pathtoimage = os.path.dirname(
                    os.path.dirname(os.path.abspath(__file__)))+imgurl
                if os.path.exists(pathtoimage):
                    os.remove(pathtoimage)
                    print('Successfully deleted')
                    updrec.image = image1
                    updrec.save()
            seller.objects.filter(id=sel).update(
                vname=name, email=email, phone=phone, username=username)
            return HttpResponseRedirect('/sellerprofile/', {"sel": ss})
    else:
	sel = request.session['sel']
	ss = seller.objects.filter(id=sel)
        return render(request, 'sellerprofile.html', {"sel": ss})


def userprofile(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        phone = request.POST['phone-number']
        username = request.POST['username']
        imgup = request.POST['chh']
        if (imgup == 'yes'):
            image1 = request.FILES['image']
            oldrec = user.objects.filter(id=use)
            updrec = user.objects.get(id=use)
            for x in oldrec:
                imgurl = x.image.url
                pathtoimage = os.path.dirname(
                    os.path.dirname(os.path.abspath(__file__)))+imgurl
                if os.path.exists(pathtoimage):
                    os.remove(pathtoimage)
                    print('Successfully deleted')
                    updrec.image = image1
                    updrec.save()
        user.objects.filter(id=use).update(
            name=name, email=email, phone=phone, username=username)
        return HttpResponseRedirect('/userprofile/')
    else:
	use = request.session['use']
	ss = user.objects.filter(id=use)
        return render(request, 'userprofile.html', {"use": ss})


def addproduct(request):
    if request.session.has_key('sel'):
        sel = request.session['sel']
        if request.method == 'POST':
            productname = request.POST['name']
            productprice = request.POST['price']
            productdes = request.POST['description']
            pimage = request.FILES['image']
            brand = request.POST['brand']
            condition = request.POST['condition']
            
            ss = seller.objects.get(id=sel)
            a = product(productname=productname, productprice=productprice,
                        productdes=productdes, pimage=pimage, sellerid=ss, brand=brand, condition=condition)
            a.save()
            return render(request, 'addproduct.html', {'aa': 'product added successfully'})
        else:
            return render(request, 'addproduct.html')
    else:
        return render(request, 'addproduct.html')


def viewproduct(request):
 if request.session.has_key('sel'):
    sel = request.session['sel']
    ss = seller.objects.get(id=sel)
    prod = product.objects.filter(sellerid=ss)
    return render(request, 'viewproduct.html', {"pro": prod})
 else:
      return render(request, 'index.html',{'success':'please login'})


def deleteproduct(request):
 if request.session.has_key('sel'):
    pro = request.GET['pro']
    rec=product.objects.filter(id=pro)
    for x in rec:
        imgurl = x.pimage.url
        pathtoimage = os.path.dirname(
				os.path.dirname(os.path.abspath(__file__)))+imgurl
        if os.path.exists(pathtoimage):
            os.remove(pathtoimage)
            print('Successfully deleted')
    rec.delete()
    return HttpResponseRedirect('/viewproduct/')
 else:
      return render(request, 'index.html',{'success':'please login'})



def updateproduct(request):
  if request.session.has_key('sel'):
    if request.method == 'POST':
        pro = request.GET['pro']
        productname = request.POST['name']
        productprice = request.POST['price']
        productdes = request.POST['description']
        brand = request.POST['brand']
        condition = request.POST['condition']
        imgup = request.POST['chh']
        if (imgup == 'yes'):
            image1 = request.FILES['image']
            oldrec = product.objects.filter(id=pro)
            updrec = product.objects.get(id=pro)
            for x in oldrec:
                imgurl = x.pimage.url
                pathtoimage = os.path.dirname(
                    os.path.dirname(os.path.abspath(__file__)))+imgurl
                if os.path.exists(pathtoimage):
                    os.remove(pathtoimage)
                    print('Successfully deleted')
                    updrec.pimage = image1
                    updrec.save()
        product.objects.filter(id=pro).update(
            productname=productname, productprice=productprice, productdes=productdes, brand=brand, condition=condition)
        pro = product.objects.filter(id=pro)
        return HttpResponseRedirect('/viewproduct/')
    else:
        pro = request.GET['pro']
        pro = product.objects.filter(id=pro)
        return render(request, 'updateproduct.html', {"pro": pro})
  else:
      return render(request, 'index.html',{'success':'please login'})




def userviewproduct(request):
   if request.session.has_key('use'):
     p=product.objects.all()
     return render(request, 'userviewproduct.html', {"pro": p})
   else:
       return render(request, 'index.html',{'success':'please login'})

def searchproduct(request):
    s=request.GET['s']
    p=product.objects.filter(productname__icontains=s)
    return render(request, 'userviewproduct.html', {"pro": p})
    
def userbooking(request):
    if request.session.has_key('use'):
      if request.method == 'POST':
        pro =request.GET['pro']
        use = request.session['use']
        fromdate = request.POST['fromdate']
        todate = request.POST['todate']
        fprice = request.POST['final_price']
        proid = product.objects.get(id=pro)
        ss = user.objects.get(id=use)
        query=product.objects.all().filter(id=pro)
        for x in query:
         selid = x.sellerid
        a = booking(bookingdatefrom=fromdate, bookingdateto=todate,
                    productid=proid, bookeduser=ss, sellerid=selid, amount=fprice,status='active')
        a.save()
        return HttpResponseRedirect('/userviewbooking/')
      else:
        prod = request.GET['pro']
        prod = product.objects.filter(id=prod)
        return render(request,'userbooking.html',{'pros':prod})
    else:
        return render(request, 'index.html',{'success':'please login'})

def userviewbooking(request):
   if request.session.has_key('use'):
      use = request.session['use']
      ss = user.objects.get(id=use)
      view=booking.objects.all().filter(bookeduser=ss)
      return render(request,'userviewbooking.html',{'ab':view})
   else:
        return render(request, 'index.html',{'success':'please login'})

def sellerviewbooking(request):
   if request.session.has_key('sel'):
      sel = request.session['sel']
      ss = seller.objects.get(id=sel)
      view=booking.objects.all().filter(sellerid=ss)
      return render(request,'sellerviewbooking.html',{'ab':view})
   else:
        return render(request, 'index.html',{'success':'please login'})

def userbookingcheck(request):
    if request.session.has_key('use'):
      fdate=request.GET.get('a')
      tdate=request.GET.get('b')
      vv=request.GET.get('c')   
      SP=booking.objects.filter(productid=vv)    
      if SP.exists():
        print("1")
        if SP.raw('SELECT a.* FROM (SELECT * FROM app_booking WHERE productid_id=%s )a WHERE %s BETWEEN bookingdatefrom AND  bookingdateto',[vv,fdate]):
             print("2")
             jj ="t"
             t={'cc': jj} 
             return JsonResponse(t)
        elif SP.raw('SELECT a.* FROM (SELECT * FROM app_booking WHERE productid_id=%s )a WHERE %s BETWEEN bookingdatefrom AND  bookingdateto',[vv,tdate]):  
             print("3")           
             jj ="t"
             t={'cc': jj} 
             return JsonResponse(t)
        else:
                print("4")
                jj="f"
                t={'cc': jj}                
                return JsonResponse(t)
      else:
                print("5")
                jj="f"
                t={'cc': jj}                
                return JsonResponse(t)


def cancelb(request):
     if request.session.has_key('use'):
         CAN=request.GET['b']
         booking.objects.filter(id=CAN).update(status='cancelled')
     return HttpResponseRedirect('/userviewbooking/')

def admin_p(request):
     if request.session.has_key('adm'):
         return render(request,'admin/index.html')
     else:
         return render(request, 'admin/login.html',{'msg':'please login'})


def user_tables(request):
    if request.session.has_key('adm'):
      a=user.objects.all()
      return render(request,'admin/user_tables.html',{'ab':a})
    else:
         return render(request, 'admin/login.html',{'msg':'please login'})

def seller_tables(request):
    if request.session.has_key('adm'):  
      a=seller.objects.all()
      return render(request,'admin/seller_tables.html',{'ab':a})
    else:
         return render(request, 'admin/login.html',{'msg':'please login'})

def product_tables(request):
    if request.session.has_key('adm'):  
       a=product.objects.all()
       return render(request,'admin/product_tables.html',{'ab':a})
    else:
         return render(request, 'admin/login.html',{'msg':'please login'})


def booking_tables(request):
    if request.session.has_key('adm'):   
      a=booking.objects.all()
      return render(request,'admin/booking_tables.html',{'ab':a})
    else:
         return render(request, 'admin/login.html',{'msg':'please login'})


def admin_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        password=hashlib.md5(password.encode('utf8')).hexdigest()
        use = User.objects.filter(username=username, password=password)
        for x in use:
            name = x.username
            pswd = x.password
            if username == name and password == pswd:
                request.session['adm'] = x.id
                return render(request, 'admin/index.html', {'success': 'successfully logged in',})
            else:
              return render(request, 'admin/login.html', {'msg': 'invalid credentials'})
        else:
            return render(request, 'admin/login.html', {'msg': 'invalid credentials'})
    else:
         return render(request, 'admin/login.html')

def admin_logout(request):
    if request.session.has_key('adm'):
        del request.session['adm']
    return render(request, 'admin/login.html')

def seller_approve(request):
     if request.session.has_key('adm'):
        sid= request.GET['sid']
        seller.objects.filter(id=sid).update(authN='Approved')
        return HttpResponseRedirect('/seller_tables/')
     else:
         return render(request, 'admin/login.html',{'msg':'please login'})


def seller_delete(request):
     if request.session.has_key('adm'):
        sid= request.GET['sid']
        sell=seller.objects.filter(id=sid).delete()
        for x in sell:
         imgurl = x.image.url
         pathtoimage = os.path.dirname(
				os.path.dirname(os.path.abspath(__file__)))+imgurl
         if os.path.exists(pathtoimage):
            os.remove(pathtoimage)
            print('Successfully deleted')
        sell.delete()
        prod=product.objects.filter(sellerid=sid)
        for x in prod:
         imgurl = x.pimage.url
         pathtoimage = os.path.dirname(
				os.path.dirname(os.path.abspath(__file__)))+imgurl
         if os.path.exists(pathtoimage):
            os.remove(pathtoimage)
            print('Successfully deleted')
        prod.delete()
        booking.objects.filter(sellerid=sid).delete()
        return HttpResponseRedirect('/seller_tables/')
     else:
         return render(request, 'admin/login.html',{'msg':'please login'})


def grids(request):
    return render(request, 'admin/grids.html',)

def userforgotpassword(request):
    if request.method == 'POST':
        email = request.POST['email']
        ab=user.objects.filter(email=email)
        if ab:
            for x in ab:
                if x.email==email:
                     subject = 'Password Reset'
                     message = f'Hi {x.name},password resetlink for your  {x.username} link: http://100.25.1.169/userchangepassword2/?uid={x.id} '
                     email_from = settings.EMAIL_HOST_USER 
                     recipient_list = [email, ] 
                     send_mail( subject, message, email_from, recipient_list ) 
                     return render(request, 'userforgotpassword.html',{'errr':"link has been sent your mail"})
                else:
                    return render(request, 'userforgotpassword.html',{'errr':"email doesn't exist"})            
        else:
            return render(request, 'userforgotpassword.html',{'errr':"email doesn't exist"})
    else:   
        return render(request, 'userforgotpassword.html')

def userchangepassword2(request):
        uid = request.GET['uid']
        if request.method == 'POST':
            newpassword = request.POST['newpassword']
            newpassword=hashlib.md5(newpassword.encode('utf8')).hexdigest()
            user.objects.filter(id=uid).update(password=newpassword)
            return HttpResponseRedirect('/userlogin/')
        else:
            ss=user.objects.filter(id=uid)
            return render(request, 'userchangepassword2.html',{'lm':ss})


def userchangepassword(request):
    if request.session.has_key('use'):
            if request.method == 'POST':
              oldpassword = request.POST['oldpassword']
              newpassword = request.POST['newpassword']
              newpassword=hashlib.md5(newpassword.encode('utf8')).hexdigest()
              oldpassword=hashlib.md5(oldpassword.encode('utf8')).hexdigest()
              use = request.session['use']
              ss = user.objects.filter(id=use)
              for x in ss:
                  if(x.password==oldpassword):
                       user.objects.filter(id=use).update(password=newpassword)
                       return render(request, 'userchangepassword.html',{'errr':'password changed'})
                  else:
                      return render(request, 'userchangepassword.html',{'errr':'wrong old password'})
            else:
             return render(request, 'userchangepassword.html')
    else:
        return render(request, 'index.html',{'success':'please login'})

def sellerchangepassword(request):
    if request.session.has_key('sel'):
            if request.method == 'POST':
              oldpassword = request.POST['oldpassword']
              newpassword = request.POST['newpassword']
              newpassword=hashlib.md5(newpassword.encode('utf8')).hexdigest()
              oldpassword=hashlib.md5(oldpassword.encode('utf8')).hexdigest()
              use = request.session['use']
              ss = seller.objects.filter(id=use)
              for x in ss:
                  if(x.password==oldpassword):
                       seller.objects.filter(id=use).update(password=newpassword)
                       return render(request, 'sellerchangepassword.html',{'errr':'password changed'})
                  else:
                      return render(request, 'sellerchangepassword.html',{'errr':'wrong old password'})
            else:
             return render(request, 'sellerchangepassword.html')
    else:
        return render(request, 'index.html',{'success':'please login'})
    
def sellerforgotpassword(request):
    if request.method == 'POST':
        email = request.POST['email']
        ab=seller.objects.filter(email=email)
        if ab:
            for x in ab:
                if x.email==email:
                     subject = 'Password Reset'
                     message = f'Hi {x.vname},password resetlink for your  {x.username} link: http://100.25.1.169/sellerchangepassword2/?uid={x.id} '
                     email_from = settings.EMAIL_HOST_USER 
                     recipient_list = [email, ] 
                     send_mail( subject, message, email_from, recipient_list ) 
                     return render(request, 'sellerforgotpassword.html',{'errr':"link has been sent your mail"})
                else:
                    return render(request, 'sellerforgotpassword.html',{'errr':"email doesn't exist"})            
        else:
            return render(request, 'sellerforgotpassword.html',{'errr':"email doesn't exist"})
    else:   
        return render(request, 'sellerforgotpassword.html')

def sellerchangepassword2(request):
        sid = request.GET['sid']
        if request.method == 'POST':
            newpassword = request.POST['newpassword']
            newpassword=hashlib.md5(newpassword.encode('utf8')).hexdigest()
            seller.objects.filter(id=uid).update(password=newpassword)
            return HttpResponseRedirect('/sellerlogin/')
        else:
            ss=seller.objects.filter(id=sid)
            return render(request, 'sellerchangepassword2.html',{'lm':ss})
        
def contact(request):
    if request.method=='POST':
      name=request.POST['name']
      email=request.POST['email']
      message1=request.POST['message']
      subject="contact us"
      message2=f'Mail sent from contact us! sender name: {name} and sender email: {email} '
      message3='                '
      message=message2+message3+message1
      email_from = settings.EMAIL_HOST_USER 
      recipient_list = ["camerarentalservices@gmail.com", ] 
      send_mail( subject, message, email_from, recipient_list ) 
      return render(request,'index.html')
    else:
     return HttpResponseRedirect('/')
