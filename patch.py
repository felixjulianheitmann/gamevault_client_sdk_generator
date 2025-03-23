# Just a bunch of patches run on the generated source to make it compatible
import json

with open("patches.json") as j:
    patches = json.load(j)
    
for file, line_patches in patches.items():
    print(f"patching: {file}")
    with open(file) as f:
        lines = f.readlines()
        for bug_line, patch in line_patches.items():
            for idx, line in enumerate(lines):
                if line.strip() == bug_line:
                    lines[idx] = patch + "\n"

    with open(file, 'w') as f:
        f.writelines(lines)

print("files patched!")