import subprocess
username = subprocess.check_output(['whoami']).strip()
user = username.decode()
subprocess.run(["rm", "-rf", f"/home/{user}/.config/nvim"])
subprocess.run(["cp", "-r", "nvim", f"/home/{user}/.config/"])
subprocess.run(["sudo", "mkdir", "/usr/local/share/fonts/truetype"])
subprocess.run(["sudo", "cp", "-r", "font.ttf"], "/usr/share/fonts/truetype/")
