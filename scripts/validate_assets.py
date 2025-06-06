import os
import json

# Base Tattoos folder

base_folder = os.path.join(os.path.dirname(__file__), '..', 'jack_tatts', 'Assets.xcassets', 'Tattoos')
base_folder = os.path.abspath(base_folder)

issues_found = False

for item in os.listdir(base_folder):
    imageset_path = os.path.join(base_folder, item)
    if item.endswith('.imageset') and os.path.isdir(imageset_path):
        json_path = os.path.join(imageset_path, "Contents.json")

        if not os.path.exists(json_path):
            print(f"❌ Missing Contents.json in {item}")
            issues_found = True
            continue

        with open(json_path, "r") as f:
            contents = json.load(f)

        expected_filenames = set()
        for img_entry in contents.get("images", []):
            filename = img_entry.get("filename")
            scale = img_entry.get("scale")
            if filename and scale in {"1x", "2x", "3x"}:
                expected_filenames.add(filename)

        actual_pngs = {file for file in os.listdir(imageset_path) if file.endswith(".png")}

        # Check for missing files
        for expected in expected_filenames:
            if expected not in actual_pngs:
                print(f"⚠️  {expected} referenced in JSON but missing in {item}")
                issues_found = True

        # Check for extra images
        for file in actual_pngs:
            if file not in expected_filenames:
                print(f"❌ Extra image in {item}: {file} (not referenced in JSON)")
                issues_found = True

        # Optional: check if all 1x, 2x, 3x are included
        if len(expected_filenames) < 3:
            print(f"⚠️  Incomplete scale set in {item} — expected 1x/2x/3x")
            issues_found = True

if not issues_found:
    print("✅ All .imageset folders are valid!")
else:
    print("\n🔍 Validation complete. Issues found above.")
