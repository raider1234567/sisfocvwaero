from django.contrib.gis.geoip2 import GeoIP2
import cv2
# from project_sisfocvwaero.settings import BASE_DIR
#helper function

def get_geo(ip):
    g = GeoIP2()
    lat, lon = g.lat_lon(ip)
    return lat, lon

def get_ip_user(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


# detector = cv2.CascadeClassifier(BASE_DIR+'/app_sisfocvwaero/haarcascade_frontalface_default.xml')

# def faceDetect(self, Entry1,):
#         face_id = Entry1
#         cam = cv2.VideoCapture(0)
        

#         count = 0

#         while(True):

#             ret, img = cam.read()
#             # img = cv2.flip(img, -1) # flip video image vertically
#             gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#             faces = detector.detectMultiScale(gray, 1.3, 5)

#             for (x,y,w,h) in faces:

#                 cv2.rectangle(img, (x,y), (x+w,y+h), (255,0,0), 2)
#                 count += 1

#                 # Save the captured image into the datasets folder
#                 cv2.imwrite(BASE_DIR+'/Face_Detection/dataset/User.' + str(face_id) + '.' + str(count) + ".jpg", gray[y:y+h,x:x+w])

#                 cv2.imshow('Register Face', img)

#             k = cv2.waitKey(100) & 0xff # Press 'ESC' for exiting video
#             if k == 27:
#                 break
#             elif count >= 30: # Take 30 face sample and stop video
#                 break
    
    
#         cam.release()
#         cv2.destroyAllWindows()