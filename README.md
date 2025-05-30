# Bash Backup Script

A Bash script that automates directory backup into a compressed `.tar.gz` file.  
Useful for learning Bash scripting, command-line interaction, and file management.

---

## 📌 Features

- Prompts for:
  - Backup name
  - Source directory
  - Destination directory
- Verifies if source directory exists
- Offers to create the destination directory if missing
- Creates a `.tar.gz` backup with the current date in the filename
- Shows:
  - Number of files and directories backed up
  - Final compressed file size
- Color-coded output for better UX

---

## 🧪 How to Use

1. Run the script:
   
	./backup.sh
   
2. Type your name, the directory you want to backup and the destination folder of the compressed `.tar.gz`
	
	Type your name: (name)  
	Type which directory you want to backup: (type the relative or absolute path)  
	Type where you want the backup to be archived: (type the relative or absolute path, if the directory doesn't exist, the script will ask you to create it)  	

---

## 📂 Output Example

If you run the script and try to archive the compressed file into a directory that doesn't exist, the result would be something like:

Type your name: aaron  
Type which directory you want to backup: /home/aaroong/Descargas  
Type where you want the backup to be archived: /home/aaroong/script-bash  
The selected directory doesn't exist.  
Would you want to create this directory? [y/n]  
The directory has been succesfully created.  

Compressing the files...  

The backup has finished.  
Backup disk usage is 112M.  
You have backed up 29 files.  
You have backed up 3 directories.  

---

## 📚 What I Learned

This project helped me practice:

- Bash control structures (`if`, `while`, `case`)
- Input/output with `read`
- Directory and file validation
- Tar compression
- Command-line UX improvements with colors
- Counting files and directories (`find`, `wc`)
- All the bash programming concepts
