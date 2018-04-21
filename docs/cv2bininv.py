import cv2  
import numpy as np  
import time

img = cv2.imread('zero.bmp',0)
cv2.imshow('image',img)
time.sleep(1)
invimg = ~img
time.sleep(1)
cv2.imshow('image',invimg)
cv2.imwrite('zeroinv.bmp',invimg)
