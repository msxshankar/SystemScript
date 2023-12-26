# Enabling S3 sleep for IdeaPad 14ARE05

## Enable in BIOS
https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_14are05


## PopOS

https://www.reddit.com/r/linuxhardware/comments/i28nm5/ideapad_14are05_s3_sleep_fix/

Add
```
    mem_sleep_default=deep    
```

to file (under options)
```
    /boot/efi/loader/entries/Pop-OS-current.conf
```
