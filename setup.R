library(reticulate)

# Set up virtual environment in the working directory
venv_path <- file.path(getwd(), "venv")
# virtualenv_create(envname = venv_path)

# Install required Python packages
# virtualenv_install(envname = venv_path, packages = c("torch", "torchvision", "opencv-python", "matplotlib", "numpy"))
# virtualenv_install(envname = venv_path, packages = c("dlib","opencv-python"))
use_virtualenv(venv_path, required = TRUE)
py_config()

# Load the Python script
source_python("helpers/hat_detection.py")
source_python("helpers/face_detection.py")

# Call the `detect_hats` function
image_path <- "data/hof_aaronha01.jpg"  # Path to your image
hat_box <- detect_hats(image_path, threshold = 0.9)
face_box <- detect_face(image_path)

# Display results
print(hat_box)


library(magick)

# Load the image
image <- image_read(image_path)
print(image)
# Draw bounding boxes
for (box in hat_box) {
  image2 <- image_draw(image)
  rect(box[1], box[2], box[3], box[4], border = "red", lwd = 3)
  dev.off()
}

# Display the image
print(image2)


# Define the bounding box coordinates (replace with actual values)
x_min <- hat_box[[1]][1]   # Left edge of the bounding box
y_min <- hat_box[[1]][2]   # Top edge of the bounding box
width <- hat_box[[1]][3]  # Width of the bounding box
height <- hat_box[[1]][4] # Height of the bounding box

# Crop the image using the bounding box
cropped_image <- image_crop(image, geometry_area(width, height, x_min, y_min))
print(cropped_image)  # Display the cropped image



# Crop the face in R using magick
if (!is.null(face_box)) {
  cropped_face <- image_crop(image, geometry_area(
    width = face_box[3], height = face_box[4],
    x_off = face_box[1], y_off = face_box[2]
  ))
  print(cropped_face)
}

for (box in face_box) {
  image3 <- image_draw(image)
  rect(face_box[1], face_box[2], face_box[3], face_box[4], border = "red", lwd = 3)
  dev.off()
}
# Display the image
print(image3)
