
org 100h   
    

main: call menu
      
         
         
 
    
ret
;---------------
;Dico de variable! 
;---------------
a db 97
b db 98
c db 99
d db 100
e db 101
f db 102
g db 103
h db 104
i db 105
j db 106
k db 107
l db 108
m db 109
n db 110
o db 111
p db 112
q db 113
r db 114
s db 115
t db 116
u db 117
v db 118
w db 119
x db 120
y db 121
z db 122

;----------------
menu:
;----------------

      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
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
       
      mov ah, 07h
      int 21h
      cmp al, a
      je menu_free1
      cmp al, b
      je training0    
      jne menu
            

      
      
num_efface db 0
num_jeux db 0 ;Savoir quel mode return
choix db 0    ;Savoir dans quelle menu return     
message  db "Bonjour, bienvenue dans EmuPiano.$"
message2 db "Choisissez votre mode de jeux : $" 
message3 db "a: Free to play !$"
message4 db "b: Training!$"
message5 db "F5: Watch me play!$"


;------------------
;Fonction du mode free
;------------------
menu_free1: call affichage_free 


           
menu_free2:           mov choix, 1
                      mov ah, 07h
                      int 21h 
                      cmp al, a
                      je piano
           
affichage_free:
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h 
      int 10h  
      mov ah, 09h
      mov dx, OFFSET free_msg1
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg2
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg3
      int 21h   
      
      mov ah, 02h
      mov dh, 03h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg4
      int 21h
      
      mov ah, 02h
      mov dh, 04h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg5
      int 21h
      
      call menu_free2


piano_free:         mov ah, 07h
                    int 21h   
                    cmp al, d
                    je DO 
                    cmp al, f
                    je RE
                    cmp al, g
                    je MI
                    cmp al, h 
                    je FA 
                    cmp al, j
                    je SOL
                    cmp al, k
                    je LA
                    cmp al, l
                    je SI_
                    jne piano_free 
         
free_msg1 db "Bienvenue dans le mode Free.                             $"
free_msg2 db "Ce mode vous permet de jouer n'importe quelles touches du piano comme vous voulez.  $"         
free_msg3 db "N'oubliez pas d'acheter le jeu si il vous plait :)                                  $"
free_msg4 db "                                                                                    $"                                                                                                    
free_msg5 db "Appuyer sur F2 pour commencer !                                                     $"                                                                                                   

         
;--------------------
; Fonction de son et d'affichage.
;--------------------  
 
      
DO:       mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET DO_A
          int 21h 
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 
          
RE:       mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET RE_A
          int 21h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note          
          
MI:       mov dl, 07h 
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET MI_A
          int 21h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 
          
FA:       mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET FA_A
          int 21h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 

SOL:      mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET SOL_A
          int 21h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 

LA:       mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET LA_A
          int 21h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note

SI_:      mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET SI_A
          int 21h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note  
          
         
                    
          
DO_A db  "|***|   |   |   |   |   |   |                                                $"   
RE_A db  "|   |***|   |   |   |   |   |                                                $"
MI_A db  "|   |   |***|   |   |   |   |                                                $"
FA_A db  "|   |   |   |***|   |   |   |                                                $"
SOL_A db "|   |   |   |   |***|   |   |                                                $"
LA_A db  "|   |   |   |   |   |***|   |                                                $"
SI_A db  "|   |   |   |   |   |   |***|                                                $"

DO_T  db 'd'
RE_T  db 'f'
MI_T  db 'g'
FA_T  db 'h'
SOL_T db 'j'
LA_T  db 'k'
SI_T  db 'l'
     
     
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
      
      cmp choix, 1
      je piano_free
      cmp choix, 2  
      je menu_musique
      
                                                                                                      
ligne1  db "|  | | | | | |  |  | | | |  |                                                                          $"
ligne2  db "|  | | | | | |  |  | | | |  |                                                                          $"
ligne3  db "|  | | | | | |  |  | | | |  |                                                                          $"
ligne4  db "|  |r| |t| |y|  |  |i| |o|  |                                                                          $"
ligne5  db "|  |_| |_| |_|  |  |_| |_|  |                                                                          $"
ligne6  db "|   |   |   |   |   |   |   |                                                                          $"
ligne7  db "|DO |RE |MI |FA |SOL|LA |SI |                                                                          $"
ligne8  db "|   |   |   |   |   |   |   |                                                                          $"
ligne9  db "|d  | f |g  |h  |j  |k  |l  |                                                                          $"
ligne10 db "[---------------------------]                                                                          $"




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
entr5 db "Appuyez sur s pour jouer                                                    $"

menu_train: mov choix, 2
            mov ah, 07h
            int 21h   
            cmp al, s 
            je piano
            jne menu_musique  

;------------------------
;Musique du piano 
;------------------------


menu_musique: 
              mov dh, 07h
              mov dl, 00h
              mov ah, 02h
              int 10h
              call add_note 

iteration db 0
 
add_note:  add iteration, 1
           call choix_note  
           
verification: 
              
              
              mov dh, 16h
              mov dl, 00h
              mov ah, 02h
              int 10h
              
              mov dx, OFFSET msg_verif
              mov ah, 09h
              int 21h
              
              mov dh, 07h
              mov dl, 00h
              mov ah, 02h
              int 10h
              
              call choix_note 
            

choix_note:  
             mov dh, 07h
             mov dl, 00h
             mov ah, 02h              
             int 10h
             cmp iteration, 1
             je note1
             cmp iteration, 2
             je note2
             cmp iteration, 3
             je note3
             cmp iteration, 4
             je note4
             cmp iteration, 5
             je note5
             cmp iteration, 6
             je note6
             cmp iteration, 7
             je note7
             cmp iteration, 8
             je note8
             cmp iteration, 9
             je note9
             cmp iteration, 10
             je note10
             cmp iteration, 11
             je note11
             cmp iteration, 12
             je note12
             cmp iteration, 12
             je note12
             cmp iteration, 13
             je note13
             cmp iteration, 14
             je note14
             cmp iteration, 15
             je note15 
             cmp iteration, 16
             je eff_musique
            
             jne bug

eff_musique: mov num_efface, 2
             call eff_ecran  
             
fin_musique: 
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h 
      int 10h  
      mov ah, 09h
      mov dx, OFFSET msg_fin1
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET msg_fin2
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET msg_fin3
      int 21h 
      
      mov ah, 07h
      int 21h
      
      cmp al, s
      je eff_musique2
      jne fin_musique
      
eff_musique2: mov num_efface, 3
             call eff_ecran   

 
msg_fin1 db "Bravo ! Vous avez fini la musique.$"
msg_fin2 db "Vous pouvez maintenant montrer votre talent dans le mode watch me play.$"  
msg_fin3 db "Appuyez maintenant sur la touche 's' pour retourner dans le menu.  $"

            
        

msg_verif db "Ce n'est pas la bonne touche reessaye! $"

;-------------------
;Fonctions d'appelle de touche lors du training
;-------------------
MI_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call MI 
          
DO_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide 
          int 21h
          
          call DO

RE_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide 
          int 21h
          
          call RE

FA_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call FA 
          
SOL_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call SOL 

LA_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call LA

SI_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call SI_
                


             
             
;-------------------
;Parce qu'on a toujours besoin d'effacer l'ecran ! 
;-------------------

eff_ecran: 
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h 
      int 10h  
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h   
      
      mov ah, 02h
      mov dh, 03h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 04h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 05h
      mov dl, 00h 
      int 10h  
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 06h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 07h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h   
      
      mov ah, 02h
      mov dh, 08h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 09h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h        
      
      mov ah, 02h
      mov dh, 10h
      mov dl, 00h 
      int 10h  
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 11h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 12h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h   
      
      mov ah, 02h
      mov dh, 13h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 14h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 15h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 16h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      cmp num_efface, 2
      je fin_musique 
      cmp num_efface, 3
      je menu
      
      


ligne_vide  db  "                                                                                                                        $"            



;-------------
;Parce qu'un bug est si vite arrive! 
;-------------

bug: mov dh, 00h
     mov dl, 00h
     mov ah, 02h
     int 10h
     mov ah, 09h
     mov dx, OFFSET msg_bug
     int 21h
     loop menu

msg_bug db "C'est moi, le dev malin qui a pense a un message de bug et la apparemment j'ai plante ! F2 retourne au menu ! :) $"   





;------------------------
;Implementation des notes de jeux ! 
;------------------------          

note1: mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF      
       jne verification  

note2: mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification

note3: mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification
       
note4: mov ah, 09h
       mov dx, OFFSET FA_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, FA_T
       je FA_T_EFF       
       jne verification  

note5: mov ah, 09h
       mov dx, OFFSET SOL_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, SOL_T
       je SOL_T_EFF       
       jne verification

note6: mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, LA_T
       je LA_T_EFF       
       jne verification
       
note7: mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, SI_T
       je SI_T_EFF       
       jne verification  

note8: mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification

note9: mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification
       
note10: mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification  

note11: mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification

note12: mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification 
       
note13: mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification  

note14: mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification

note15: mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification
       
