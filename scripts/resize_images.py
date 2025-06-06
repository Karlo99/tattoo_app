from PIL import Image
import os

# Base Tattoos folder
base_folder = '/Users/marianamontoya/PersonalProjects/tattoo_app/jack_tatts/Assets.xcassets/Tattoos'

for item in os.listdir(base_folder):
    imageset_path = os.path.join(base_folder, item)
    if item.endswith('.imageset') and os.path.isdir(imageset_path):
        for file in os.listdir(imageset_path):
            if file.lower().endswith('.png'):
                img_path = os.path.join(imageset_path, file)
                img = Image.open(img_path)
                width, height = img.size
                
                # Create 2x and 3x file names
                filename_no_ext = os.path.splitext(file)[0]
                ext = os.path.splitext(file)[1]

                # Save 2x
                img_2x = img.resize((width * 2, height * 2), Image.LANCZOS)
                img_2x.save(os.path.join(imageset_path, f"{filename_no_ext}@2x{ext}"))

                # Save 3x
                img_3x = img.resize((width * 3, height * 3), Image.LANCZOS)
                img_3x.save(os.path.join(imageset_path, f"{filename_no_ext}@3x{ext}"))

                print(f"Processed {file} in {item}")

print("Done resizing images in all .imageset folders!")