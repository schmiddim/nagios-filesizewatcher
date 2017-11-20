# Nagios: Check Filesizes in Folder



This script monitors a folder for large Files and sends warnings / criticals if a file in the folder has a certain size


## Usage

```
/usr/local/nagios/libexec/check_filesize.sh <folder  <warning> <critical>
```

## Example

The scripts alerts with warning if a file in */var/log* is larger than **1000MB** and 
critical if a file is larger than **2000MB**
```
./check_filesize.sh /var/log/ 1000 2000

```

