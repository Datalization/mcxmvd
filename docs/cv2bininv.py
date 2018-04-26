import cv2  

img = cv2.imread('zero.bmp',0)
invimg = ~img
cv2.imwrite('zeroinv.bmp',invimg)
