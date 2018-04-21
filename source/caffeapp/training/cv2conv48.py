import cv2  
import os

dir='./images'

for root, dirs, files in os.walk(dir):
    for file in files:
        print(file)
        inputfile='./images/'+str(file)
        img = cv2.imread(inputfile,0)
        resized_image = cv2.resize(img, (48, 48)) 
        invimg = ~resized_image
        outputfile='./images48/'+str(file)
        print(outputfile)
        cv2.imwrite(outputfile,invimg)
