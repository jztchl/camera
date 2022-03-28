from cryptography.fernet import Fernet
message="vasu0"
key = "8kFlNXBwK5iMiviWIjG9A13g3h6xhoSqU2mWcddkQSY="
fernet=Fernet(key)
print(key)
encmessage=fernet.encrypt(message.encode())
print("og:",message)
print("enc:",encmessage.decode())
encmessage=encmessage.decode()
encmessage=encmessage.replace('%27', "'")
print("enc replaced:",encmessage)
encmessage=encmessage.replace("'", "%27")
print("enc 2nd replaced:",encmessage)
encmessage=encmessage.encode()
decmessage=fernet.decrypt(encmessage).decode()
print("dec:",decmessage)
