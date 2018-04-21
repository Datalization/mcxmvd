import cv2  
import os

dir='./images'

for root, dirs, files in os.walk(dir):
    for file in files:
        print(file)
        inputfile='./images/'+str(file)
        img = cv2.imread(inputfile)
        GrayImage=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)  
        ret,thresh1=cv2.threshold(GrayImage,132,255,cv2.THRESH_BINARY)  
        resized_image = cv2.resize(thresh1, (48, 48)) 
        invimg = ~resized_image
        outputfile='./images48/'+str(file)
        print(outputfile)
        cv2.imwrite(outputfile,invimg)
