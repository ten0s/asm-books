Build

```
$ make
```

Run

```
$ ./upper < upper.asm | tail -4
EXIT:
    MOV EAX, 1                      ; SYS_EXIT CALL
    MOV EBX, 0                      ; SUCCESS: 0
    INT 0X80                        ; MAKE SYSTEM CALL
```

Debug

```
$ gdb -q ./upper
```
