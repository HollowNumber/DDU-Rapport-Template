import os
import re

# Define the root directory path
root_dir_path = './src/appendix'

# Define the appendix file path
appendix_path = './src/chapters/appendix.typ'

# Read the contents of the appendix.typ file into a string
with open(appendix_path, 'r') as f:
    appendix_contents = f.read()

# Extract the existing headers into a list
existing_headers = re.findall(r'^= (.+)$', appendix_contents, re.MULTILINE)

# Open the appendix.typ file in append mode
with open(appendix_path, 'a') as f:
    # Use os.walk to iterate over each directory in the root directory
    for dir_path, dirs, files in os.walk(root_dir_path):
        # If it's not the root directory
        if dir_path != root_dir_path:
            # Get the directory name
            dir_name = os.path.basename(dir_path)
            # If the header has not already been added to the appendix.typ file
            if dir_name not in existing_headers:
                # Convert the directory name to lowercase and replace spaces with hyphens for label
                label = re.sub(r'\s+', '-', dir_name.lower())
                # Write a header to the file with the directory name
                f.write(f'= {dir_name.capitalize()} <{label}>\n')
                f.write('\n')

        # Iterate over the list of files
        for file in files:
            # Get the file extension
            _, ext = os.path.splitext(file)
            # If it's a code file
            if ext.lower() in ['.cs', '.c', '.cpp', '.py', '.java', '.js']:
                # If the code file has not already been added to the appendix.typ file
                if f'<{file}>' not in appendix_contents:
                    # Get the relative path from the appendix file to the code file
                    rel_path = os.path.relpath(os.path.join(dir_path, file), os.path.dirname(appendix_path)).replace('\\', '/')
                    # Write a sub header to the appendix.typ file without the file extension
                    file_name = re.sub(r'\..+$', '', file)
                    f.write(f'== {file_name.capitalize()} <{file_name}>\n')
                    # Write a #sourcefile block to the appendix.typ file
                    f.write(f'#sourcefile(read("{rel_path}"), file: "{file}")\n')
                    f.write('\n')
            # If it's an image file
            elif file.lower().endswith(('.png', '.jpg', '.jpeg', '.gif', '.bmp')):
                # Extract the image name without extension
                image_name = re.sub(r'\..+$', '', file)
                # If the image has not already been added to the appendix.typ file
                if f'<{image_name}>' not in appendix_contents:
                    # Get the relative path from the appendix file to the image file
                    rel_path = os.path.relpath(os.path.join(dir_path, file), os.path.dirname(appendix_path)).replace('\\', '/')
                    # Write a formatted string to the appendix.typ file
                    f.write(f'#figure(\n  image("{rel_path}", width: 100%),\n  caption: [{image_name}],\n) <{image_name}>\n')
                    f.write('\n')