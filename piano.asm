
org 100h   
    

main: call menu
      
         
         
 
    
ret
;----------------
menu:
;----------------
      mov ah, 09h
      mov dx, OFFSET message
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message2
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message3
      int 21h   
      
      mov ah, 02h
      mov dh, 03h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message4
      int 21h
      
      mov ah, 02h
      mov dh, 04h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message5
      int 21h
      
      mov ax, 00h
      int 16h
      cmp ax, 3C00H
      je piano 
      


        
message  db "Bonjour, bienvenue dans EmuPiano.$"
message2 db "Choisissez votre mode de jeux : $" 
message3 db "F2: Free to play !$"
message4 db "F3: Training!$"
message5 db "F5: Watch me play!$"


;------------------
free:
;------------------
         mov ax, 00h
         int 16h   
         cmp ax, 3C00h
         je bip 
         cmp ax, 3D00h
         je bip
         cmp ax, 3F00h
         je bip
         cmp ax, 011Bh
         je bip
         jne free 
         
         
         

         
;--------------------
bip:
;-------------------- 
     
     mov dl, 07h
     mov ah, 2
     int 21h
     loop  free 
     
     
;--------------------
piano:
;--------------------

      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne1
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne2
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne3
      int 21h   
      
      mov ah, 02h
      mov dh, 03h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne4
      int 21h
      
      mov ah, 02h
      mov dh, 04h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne5
      int 21h 
      
      mov ah, 02h
      mov dh, 05h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne6
      int 21h
            
      mov ah, 02h
      mov dh, 06h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne7
      int 21h 
      
      mov ah, 02h
      mov dh, 07h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne8
      int 21h   
      
      mov ah, 02h
      mov dh, 08h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne9
      int 21h
      
      mov ah, 02h
      mov dh, 09h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne10
      int 21h
      
      call free 
      
ligne1  db "|  *  *  *  |                      $"
ligne2  db "|  *  *  *  |                      $"
ligne3  db "|  *  *  *  |                      $"
ligne4  db "|  *  *  *  |                      $"
ligne5  db "|  *  *  *  |                      $"
ligne6  db "|  |  |  |  |                      $"
ligne7  db "|  |  |  |  |                      $"
ligne8  db "|  |  |  |  |                      $"
ligne9  db "|F2|F3|F5|ES|                      $"
ligne10 db "[-----------]                      $"
