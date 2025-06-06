from PIL import Image
import os
import json

# Base Tattoos folder
base_folder = os.path.join(os.path.dirname(__file__), '..', 'jack_tatts', 'Assets.xcassets', 'Tattoos')
base_folder = os.path.abspath(base_folder)

for item in os.listdir(base_folder):
    imageset_path = os.path.join(base_folder, item)
    if item.endswith('.imageset') and os.path.isdir(imageset_path):
        base_image = None

        # Find the base image (1x version)
        for file in os.listdir(imageset_path):
            if file.lower().endswith('.png') and "@2x" not in file and "@3x" not in file:
                base_image = file
                break

        if base_image:
            img_path = os.path.join(imageset_path, base_image)
            img = Image.open(img_path)
            width, height = img.size

            filename_no_ext = os.path.splitext(base_image)[0]
            ext = os.path.splitext(base_image)[1]

            # Define expected files
            expected_files = {
                base_image,
                f"{filename_no_ext}@2x{ext}",
                f"{filename_no_ext}@3x{ext}",
                "Contents.json"
            }

            # Create @2x and @3x images
            img_2x = img.resize((width * 2, height * 2), Image.LANCZOS)
            img_3x = img.resize((width * 3, height * 3), Image.LANCZOS)

            img_2x.save(os.path.join(imageset_path, f"{filename_no_ext}@2x{ext}"), optimize=True)
            img_3x.save(os.path.join(imageset_path, f"{filename_no_ext}@3x{ext}"), optimize=True)

            # Update Contents.json
            contents = {
                "images": [
                    {"idiom": "universal", "filename": base_image, "scale": "1x"},
                    {"idiom": "universal", "filename": f"{filename_no_ext}@2x{ext}", "scale": "2x"},
                    {"idiom": "universal", "filename": f"{filename_no_ext}@3x{ext}", "scale": "3x"}
                ],
                "info": {"version": 1, "author": "xcode"}
            }

            with open(os.path.join(imageset_path, "Contents.json"), "w") as f:
                json.dump(contents, f, indent=4)

            # Delete unexpected files
            for file in os.listdir(imageset_path):
                if file.endswith('.png') and file not in expected_files:
                    os.remove(os.path.join(imageset_path, file))
                    print(f"🗑️ Removed unexpected image: {file} in {item}")

            print(f"✅ Cleaned and updated: {item}")

print("🎉 All .imageset folders processed and cleaned!")
