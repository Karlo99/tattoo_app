import os
import json

# Path to your Tattoos folder
base_folder = '/Users/marianamontoya/PersonalProjects/tattoo_app/jack_tatts/Assets.xcassets/Tattoos'

for item in os.listdir(base_folder):
    imageset_path = os.path.join(base_folder, item)
    
    if item.endswith('.imageset') and os.path.isdir(imageset_path):
        base_name = item.replace('.imageset', '')
        base_image = f"{base_name}.png"

        # Step 1: Remove @2x and @3x images
        for file in os.listdir(imageset_path):
            if '@2x' in file or '@3x' in file:
                full_path = os.path.join(imageset_path, file)
                os.remove(full_path)
                print(f"🗑️ Deleted: {full_path}")

        # Step 2: Check if base image exists
        base_image_path = os.path.join(imageset_path, base_image)
        if not os.path.exists(base_image_path):
            print(f"⚠️ Skipping {imageset_path} – base image '{base_image}' not found.")
            continue

        # Step 3: Update Contents.json
        contents_path = os.path.join(imageset_path, 'Contents.json')
        contents = {
            "images": [
                {
                    "idiom": "universal",
                    "filename": base_image,
                    "scale": "1x"
                }
            ],
            "info": {
                "version": 1,
                "author": "xcode"
            }
        }

        with open(contents_path, 'w') as f:
            json.dump(contents, f, indent=4)
            print(f"✅ Updated: {contents_path}")

print("\n🎉 Done! All @2x/@3x images removed and Contents.json updated.")
