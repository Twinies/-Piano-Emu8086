
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
      cmp ax, 3D00H
      je training0 
      


        
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
         je bip1 
         cmp ax, 3D00h
         je bip2
         cmp ax, 3F00h
         je bip3
         cmp ax, 011Bh 
         je bip4
         jne free 
         
         
         

         
;--------------------
; Fonction de son et d'affichage.
;--------------------  
     
bip1:     mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET touche1
          int 21h
          loop  free  
          
bip2:     mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET touche2
          int 21h
          loop  free            
          
bip3:     mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET touche3
          int 21h
          loop  free 
          
bip4:     mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET touche4
          int 21h
          loop  free
          
          
touche1 db "|**|  |  |  |                      $"   
touche2 db "|  |**|  |  |                      $"
touche3 db "|  |  |**|  |                      $"   
touche4 db "|  |  |  |**|                      $"  
     
     
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
      
ligne1  db "|  *  *  |  |                                                                          $"
ligne2  db "|  *  *  |  |                                                                          $"
ligne3  db "|  *  *  |  |                                                                          $"
ligne4  db "|  *  *  |  |                                                                          $"
ligne5  db "|  *  *  |  |                                                                          $"
ligne6  db "|  |  |  |  |                                                                          $"
ligne7  db "|  |  |  |  |                                                                          $"
ligne8  db "|  |  |  |  |                                                                          $"
ligne9  db "|F2|F3|F5|ES|                                                                          $"
ligne10 db "[-----------]                                                                          $"




;---------------------
;Mode d'entrainement.
;---------------------

training0: mov dh, 00h
           call training 
           mode db 2

training: 
          mov ah, 02h
          mov dl, 00h
          int 10h 
            
          cmp dh, 0
          je training1 
          
          cmp dh, 1
          je training2
          
          cmp dh, 2
          je training3
          
          cmp dh, 3
          je training4
          
          cmp dh, 4
          je training5
           
          cmp dh, 5
          je menu_train
          
          
          
           
training1: mov ah, 09h
           mov dx, OFFSET entr1
           int 21h
           mov dh, 1
           loop training

training2: mov ah, 09h
           mov dx, OFFSET entr2
           int 21h
           mov dh, 2
           loop training

training3: mov ah, 09h
           mov dx, OFFSET entr3
           int 21h
           mov dh, 3
           loop training
           
training4: mov ah, 09h
           mov dx, OFFSET entr4
           int 21h
           mov dh, 4
           loop training
           
training5: mov ah, 09h
           mov dx, OFFSET entr5
           int 21h
           mov dh, 5
           loop training 

     
entr1 db "Vous voila maintenant dans le mode d'entrainement.                          $" 
entr2 db "Vous allez voir apparaitre des touche elles auront des etoiles au dessus.   $"
entr3 db "Jouez ces touches, si vous ne jouez pas les bonnes elle seront redemandees. $"
entr4 db "Allez bon courage vous allez y arriver!                                     $"
entr5 db "Appuyez sur F2 pour jouer                                                   $"

menu_train: mov ax, 00h
            int 16h   
            cmp ax, 3C00h  
            je piano         
            
