import cv2

def detect_face(image_path):
    # Load the pre-trained Haar cascade for face detection
    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

    # Read the image
    image = cv2.imread(image_path)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Detect faces
    faces = face_cascade.detectMultiScale(
    gray, scaleFactor=1.05, minNeighbors=3, minSize=(30, 30))


    # Return the first detected face's bounding box (x, y, w, h)
    if len(faces) > 0:
        return faces[0]
    else:
        return None
