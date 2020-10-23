
import cv2
import numpy as np

img = cv2.imread('inference/images/ID121_6.jpg')

net = cv2.dnn.readNetFromONNX('weights/best.onnx')

blob = cv2.dnn.blobFromImage(img, 1.0,
		(640, 640), (114.7748, 107.7354, 99.4750),
		swapRB=True, crop=True)

blob = np.transpose(blob, (1, 0, 2, 3))
blob = np.expand_dims(blob, axis=0)