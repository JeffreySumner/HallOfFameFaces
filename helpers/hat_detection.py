import torch
from torchvision.models.detection import fasterrcnn_resnet50_fpn
from torchvision.transforms import functional as F
from PIL import Image
import cv2
import numpy as np

# Load the pre-trained model
model = fasterrcnn_resnet50_fpn(pretrained=True)
model.eval()

def detect_hats(image_path, threshold=0.5):
    # Load the image
    image = Image.open(image_path).convert("RGB")
    image_tensor = F.to_tensor(image).unsqueeze(0)

    # Run inference
    with torch.no_grad():
        outputs = model(image_tensor)

    # Filter results
    boxes = outputs[0]['boxes'].numpy()
    scores = outputs[0]['scores'].numpy()
    high_conf_indices = [i for i, score in enumerate(scores) if score > threshold]
    boxes = boxes[high_conf_indices]

    # Return bounding box coordinates
    return boxes.tolist()
