import numpy as np
import cv2

class Feature():

    def __init__(self, detections, seq_info, frame_idx):
        self.detections = detections
        self.image = cv2.imread(seq_info["image_filenames"][frame_idx])

    def extract_features(self):

        for det in self.detections:

            pt1,pt2,w,h = det.tlwh
            pt3,pt4 = pt1+w, pt2+h

            #hsv_hist = []

            imgcp = cv2.cvtColor(self.image[int(pt2):int(pt4), int(pt1):int(pt3)], cv2.COLOR_BGR2HSV)
            """
            color = ('h','s','v')
            for i,col in enumerate(color):
                max = 256
                bins = 64
                if col is 'h':
                    max = 180
                    bins = 45
                hist = cv2.calcHist([imgcp],[i], None,[bins], [0,max])
                hsv_hist= np.append(hsv_hist,hist)

            det.feature = hsv_hist
            """
            h_max = 180
            h_bins = 45
            sv_max = 256
            sv_bins = 64
            h_hist = cv2.calcHist([imgcp],[0], None,[h_bins], [0,h_max])
            s_hist = cv2.calcHist([imgcp],[1], None,[sv_bins], [0,sv_max])
            v_hist = cv2.calcHist([imgcp],[2], None,[sv_bins], [0,sv_max])
            hsv_hist = np.concatenate((h_hist.reshape(h_bins), s_hist.reshape(sv_bins), v_hist.reshape(sv_bins)))
            det.feature = hsv_hist
