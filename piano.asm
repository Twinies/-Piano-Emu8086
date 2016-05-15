
org 100h

int 16h
mov ah, [00h]
variable Db "k"
cmp ah, variable
je bip


mov variable, ah
int 21h
mov ah, 06h
mov dx, OFFSET variable


int 20h



ret

bip : mov dl, 07h
      mov ah, 2
      int 21h
