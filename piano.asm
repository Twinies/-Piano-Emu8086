
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

_WinMain@16  
    

main: call menu
      
         
         
 
    
ret16
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
principal db 0 

rouge db 12     ;Le rouge correspondra dans le code a la couleur des notes.
couleur db 15 
musique_choisi db 0
ret_cho_mus db 0 
            
;----------------
menu:            
;---------------
mov principal, 1
call eff_ecran

;----------------
menu_principal:
;---------------- 
      mov guitare,  0            ;On reinitialise tout a 0
      mov ret_cho_mus, 0
      mov musique_choisi, 0
      mov num_efface, 0
      mov num_jeux, 0
      mov choix, 0
      mov watch, 0 
      mov watch_verif, 0
      mov verif_retour, 0
      mov compteur_vie, 0
      mov iteration_watch, 0
      mov principal, 0 
      mov iteration, 0
      


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
      
      mov ah, 02h
      mov dh, 05h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message6
      int 21h
       
      mov ah, 07h
      int 21h
      cmp al, a
      je menu_free1
      cmp al, b
      je training0
      cmp al, c
      je MENU_WATC 
      cmp al, d   
      je choix_couleur
      cmp al, f
      je menu_guitare
      jne menu_principal  
      
    
            

      
      
num_efface db 0
num_jeux db 0                                  ;Savoir quel mode return
choix db 0                                     ;Savoir dans quelle menu return     
message  db " O    Bonjour, bienvenue dans EmuPiano.$"
message2 db "\|/   Choisissez votre mode de jeux :  $" 
message3 db " |    A: Free to play !                $"
message4 db "/ \   B: Training!                     $"
message5 db "      C: Watch me play!                $"
message6 db "      D: Super option ! et F:Guitare!  $"

;-----------------
;Swap color ! Parce que c'est drole ! 
;-----------------                     

choix_couleur:        
                      mov principal, 1  
                      mov ah, 02h
                      mov dh, 00h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col1
                      int 21h 
                      
                      mov ah, 02h
                      mov dh, 01h
                      mov dl, 00h 
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col2
                      int 21h 
                      
                      mov ah, 02h
                      mov dh, 02h
                      mov dl, 00h 
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col3
                      int 21h   
                      
                      mov ah, 02h
                      mov dh, 03h
                      mov dl, 00h 
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col4
                      int 21h
                      
                      mov ah, 02h
                      mov dh, 04h
                      mov dl, 00h 
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col5
                      int 21h  
                      
                      mov ah, 02h
                      mov dh, 05h
                      mov dl, 00h 
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col6
                      int 21h   
                      
                      mov ah, 02h
                      mov dh, 06h
                      mov dl, 00h 
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col7
                      int 21h 
                      
                      mov ah, 07h
                      int 21h
                      cmp al, b
                      je bleu
                      cmp al, m
                      je magenta
                      cmp al, v
                      je vert 
                      cmp al, j  
                      je jaune
                      cmp al, o   
                      je blanc 
                      cmp al, w
                      je touche_vert
                      cmp al, x
                      je touche_jaune
                      cmp al, c
                      je touche_magenta
                      cmp al, r
                      je touche_rouge
                      jne choix_couleur
                      
bleu: mov couleur, 9
       call eff_ecran 

magenta: mov couleur, 13
          call eff_ecran
          
vert: mov couleur, 2
       call eff_ecran
      
jaune: mov couleur, 14
        call eff_ecran
        
blanc: mov couleur, 15
        call eff_ecran    
        
touche_vert: mov rouge, 2     
             call eff_ecran
            
touche_jaune: mov rouge, 14     
              call eff_ecran       
                       
touche_magenta: mov rouge, 13    
                call eff_ecran 
                
touche_rouge: mov rouge, 12
              call eff_ecran
             
msg_col1 db "Choisissez la couleur de votre interface !$"
msg_col2 db "B  : Pour un super bleu qui envoie de la cacahuete !$"
msg_col3 db "M  : Pour un mangenta qui tire au violet !$"
msg_col4 db "V  : Pour un jolie vert comme le kiwi !$"
msg_col5 db "J  : Pour le cas ou vous voulez tuer vos yeux avec du jaune ! $"
msg_col6 db "O  : La bas ... c'est blanc quoi, la base... $"
msg_col7 db "Bon la c'est pour la couleurdes notes ! W=Vert, X=Jaune, C=Magenta et R=Rouge$"

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


piano_free:         
                    


                    mov ah, 07h
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
                    cmp al, a
                    je menu  
                    cmp al, r
                    je DO_#
                    cmp al, t
                    je RE_#
                    cmp al, y
                    je MI_#
                    cmp al, i
                    je SOL_#
                    cmp al, o
                    je LA_#
                    jne piano_free 
         
free_msg1 db "Bienvenue dans le mode Free.                                                                               $"
free_msg2 db "Ce mode vous permet de jouer n'importe quelles touches du piano comme vous voulez.                         $"         
free_msg3 db "N'oubliez pas d'acheter le jeu si il vous plait :)                                                         $"
free_msg4 db "Appuyez sur 'A' pour sortir du jeu a tout moment.                                                          $"                                                                                                    
free_msg5 db "Appuyer sur F2 pour commencer !                                                                            $"                                                                                                   

         
;--------------------
; Fonction de son et d'affichage.
;--------------------  
 
      
DO:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h
          
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 01h
          int 10h
          
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, rouge
          int 10h 
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 
          cmp watch, 1 
          je add_note  
          cmp watch, 2
          je add_watch_note  
          
RE:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h
          
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h


          mov dl, 07h
          mov ah, 02h
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 05h
          int 10h
          
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, rouge
          int 10h 
          
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 
          cmp watch, 1
          je add_note 
          cmp watch, 2
          je add_watch_note          
          
MI:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h
          
          mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h


          mov dl, 07h 
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 09h
          int 10h
          
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, rouge
          int 10h 
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 
          cmp watch, 1 
          je add_note 
          cmp watch, 2
          je add_watch_note  
          
FA:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h
          
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 13
          int 10h
          
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, rouge
          int 10h 
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note 
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note  

SOL:      mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h
          
          mov ah, 02h              ;ne pas toucher.
          mov dh, 07h
          mov dl, 00h
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 11h
          int 10h
          
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, rouge
          int 10h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note  
          cmp watch, 1 
          je add_note 
          cmp watch, 2
          je add_watch_note  

LA:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h
          
          mov ah, 02h                    ;Pas toucher ! 
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 15h
          int 10h
          
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, rouge
          int 10h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note  

SI_:      mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h
           
          mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 25
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, rouge
          int 10h
       
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note    
          
          
DO_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 4
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, rouge
          int 10h 
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note 
          
RE_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 8
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, rouge
          int 10h 
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note 
          
MI_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h
          
          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 16
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, rouge
          int 10h   
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note 

FA_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 12
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, rouge
          int 10h 
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note  
          
SOL_#:    mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 20
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, rouge
          int 10h  
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note  
          
LA_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET note_vide
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h
                    
          mov ah, 09h
          mov dx, OFFSET notete_vide
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 24
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, rouge
          int 10h
          
          cmp choix, 1
          je piano_free
          cmp choix, 2
          je add_note
          cmp watch, 1 
          je add_note
          cmp watch, 2
          je add_watch_note 
          
         
notete_vide db  "|  |_| |_|  |  |_| |_| |_|  |$"                   
note_vide db    "|   |   |   |   |   |   |   |$"          
DO_A db        "|***|   |   |   |   |   |   |                                                $"   
RE_A db        "|   |***|   |   |   |   |   |                                                $"
MI_A db        "|   |   |***|   |   |   |   |                                                $"
FA_A db        "|   |   |   |***|   |   |   |                                                $"
SOL_A db       "|   |   |   |   |***|   |   |                                                $"
LA_A db        "|   |   |   |   |   |***|   |                                                $"
SI_A db        "|   |   |   |   |   |   |***|                                                $"

DO_T  db 'd'
RE_T  db 'f'
MI_T  db 'g'
FA_T  db 'h'
SOL_T db 'j'
LA_T  db 'k'
SI_T  db 'l'  

;--------------------
;Menu du choix de musique
;--------------------
choix_musique: mov ret_cho_mus, 1
               call eff_ecran
choix_musique22: 
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET choix_musique1
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET choix_musique2
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET choix_musique3
      int 21h   
      
      mov ah, 02h
      mov dh, 03h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET choix_musique4
      int 21h   
      
      mov ah, 07h
      int 21h
      cmp al, a
      je musique_1
      cmp al, b
      je musique_2
      cmp al, c
      je musique_3
      jne choix_note
      
cho_musique db 0
      
musique_1: mov musique_choisi, 1
           mov cho_musique, 1
           call piano
           
musique_2: mov musique_choisi, 1
           mov cho_musique, 2
           call piano
          
musique_3: mov musique_choisi, 1
           mov cho_musique, 3
           call piano

choix_musique1 db "Quelle musique voulez vous jouer ?$"
choix_musique2 db "A: Lettre a Elise $"
choix_musique3 db "B: Tetris    $"
choix_musique4 db "C: Danse Hongroise $"
     
     
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
      cmp musique_choisi, 1  
      je add_note
      cmp watch, 1
      je add_note  
      
DO__A   db "|  |*| |_|  |  |_| |_| |_|  |                                                 $"
RE__A   db "|  |_| |*|  |  |_| |_| |_|  |                                                 $"
MI__A   db "|  |_| |_|  |  |*| |_| |_|  |                                                 $"
SOL__A  db "|  |_| |_|  |  |_| |*| |_|  |                                                 $"
LA__A   db "|  |_| |_|  |  |_| |_| |*|  |                                                 $"   
                                                                                                      
ligne1  db "|  | | | |  |  | | | | | |  |                                                 $"
ligne2  db "|  | | | |  |  | | | | | |  |                                                 $"
ligne3  db "|  | | | |  |  | | | | | |  |                                                 $"
ligne4  db "|  |r| |t|  |  |y| |i| |o|  |                                                 $"
ligne5  db "|  |_| |_|  |  |_| |_| |_|  |                                                 $"
ligne6  db "|   |   |   |   |   |   |   |                                                 $"
ligne7  db "|DO |RE |MI |FA |SOL|LA |SI |                                                 $"
ligne8  db "|   |   |   |   |   |   |   |                                                 $"
ligne9  db "|d  | f |g  |h  |j  |k  |l  |                                                 $"
ligne10 db "[---------------------------]                                                 $"




;---------------------
;Mode d'entrainement.
;---------------------

training0: mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h   

           mov dh, 00h
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
entr5 db "Appuyez sur s pour choisir la musique                                                                                                                   $"

menu_train: mov choix, 2
            mov ah, 07h
            int 21h   
            cmp al, s 
            je menu_musique
            jne menu_train
;------------------------
;Musique du piano 
;------------------------


menu_musique: 
              mov dh, 07h
              mov dl, 00h
              mov ah, 02h
              int 10h
              call choix_musique

iteration db 0
 
add_note:  mov verif_retour, 1
           add iteration, 1
           call choix_note 
            
           
verification: 
              
              mov dh, 16
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
              cmp watch_verif, 1
              je watch_vie
              cmp verif_retour,1
              je choix_note
              
            

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
              cmp iteration,16
             je note16
             cmp iteration, 17
             je note17
             cmp iteration, 18
             je note18
             cmp iteration, 19
             je note19
             cmp iteration, 20
             je note20
            
             jne bug

eff_musique: mov ret_cho_mus, 0
             mov num_efface, 2
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

 
msg_fin1 db "Bravo ! Vous avez fini la musique.                                     $"
msg_fin2 db "Vous pouvez maintenant montrer votre talent dans le mode watch me play.$"  
msg_fin3 db "Appuyez maintenant sur la touche 's' pour retourner dans le menu.      $"

            
        

msg_verif db "Ce n'est pas la bonne touche reessaye!                                 $"

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
          
DO__T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call DO_# 
          
RE__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call RE_#  
         
MI__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call MI_# 
                    
SOL__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call SOL_#
         
LA__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_vide
          int 21h
          
          call LA_#
          
          
          
;---------------------
;Mode Watch me play! 
;--------------------- 
watch db 0 
watch_verif db 0
verif_retour db 0
compteur_vie db 0

eff_watch: mov num_efface, 4
            call eff_ecran

MENU_WATC0 db 0              
                            
MENU_WATC: mov MENU_WATC0, 1 
            call eff_ecran                           

menu_watch: mov MENU_WATC0, 0
            mov watch_verif, 1
            mov watch, 1

            mov dh, 00h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_ligne1
            int 21h 
            
            mov dh, 01h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_ligne2
            int 21h
            
            mov dh, 02h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_ligne3
            int 21h
            
            mov ah, 07h
            int 21h
            cmp al, s
            je choix_musique
            jne menu_watch                    
 
watch_ligne1 db "Vous voila dans le mode watch me play. Vous allez voir une melodie.$"
watch_ligne2 db "Essayez de tout jouer d'une traite.                                $"
watch_ligne3 db "Appuyez sur 's' pour choisir votre musique.                        $"             
                

iteration_watch db 0 

menu_joueur:    mov dh, 17
                mov dl, 00h
                mov ah, 02h
                int 10h
                mov ah, 09h
                mov dx, OFFSET msg_vie1
                int 21h 
                
                mov ah, 02h
                mov dh, 07h
                mov dl, 00h
                int 10h
                mov ah, 09h
                mov dx, OFFSET ligne8
                int 21h
                mov watch, 2
                call add_watch_note

add_watch_note:           
                mov watch, 2
                mov verif_retour, 2
                add iteration_watch, 1
                call watch_note
                
watch_note:  mov dh, 07h
             mov dl, 00h
             mov ah, 02h              
             int 10h
             cmp iteration_watch, 1
             je note_watch1
             cmp iteration_watch, 2
             je note_watch2
             cmp iteration_watch, 3
             je note_watch3
             cmp iteration_watch, 4
             je note_watch4
             cmp iteration_watch, 5
             je note_watch5
             cmp iteration_watch, 6
             je note_watch6
             cmp iteration_watch, 7
             je note_watch7
             cmp iteration_watch, 8
             je note_watch8
             cmp iteration_watch, 9
             je note_watch9
             cmp iteration_watch, 10
             je note_watch10
             cmp iteration_watch, 11
             je note_watch11
             cmp iteration_watch, 12
             je note_watch12
             cmp iteration_watch, 13
             je note_watch13
             cmp iteration_watch, 14
             je note_watch14
             cmp iteration_watch, 15
             je note_watch15 
             cmp iteration_watch, 16
             je note_watch16
             cmp iteration_watch, 16
             je note_watch16
             cmp iteration_watch, 17
             je note_watch17
             cmp iteration_watch, 18
             je note_watch18
             cmp iteration_watch, 19
             je note_watch19
             cmp iteration_watch, 20
             je note_watch20
             
             
fin_watc0 db 0
             
fin_watc: mov ret_cho_mus, 0
          mov fin_watc0, 1 
          call eff_ecran
             
fin_watch:  mov fin_watc0, 2
            mov dh, 00h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET msg_fin_watch1
            int 21h 
            
            mov dh, 01h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET msg_fin_watch2
            int 21h
          
            mov dh, 02h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET msg_fin_watch3
            int 21h  
            
            mov ah, 07h
            int 21h
      
            cmp al, s
            je eff_ecran
            jne fin_musique
            
            

msg_fin_watch1 db "Bravoooooo tu as gagne t'es plutot bon !                                $"
msg_fin_watch2 db "Bon bah maintenant il faut attendre le dlc avec les chansons hardcore...$"
msg_fin_watch3 db "Appuye sur 's' pour retourner au menu                                   $"          
          
 
watch_vie: add compteur_vie, 1

           cmp compteur_vie, 1
           je vie_1
           cmp compteur_vie, 2
           je vie_2
           cmp compteur_vie, 3
           je watch_lose

vie_1:    mov dh, 17
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET msg_vie2
          int 21h
          
          call watch_note
          
vie_2:    mov dh, 17
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET msg_vie3
          int 21h
          
          call watch_note      
          

msg_vie1 db "Je suis le compteur, tu as 3 vies pour la partie!   $"
msg_vie2 db "Il te reste 2 vies  !                               $"
msg_vie3 db "Il te reste 1 vie   !                               $"  
          
watch_lose: mov ret_cho_mus, 0
            call eff_ecran 

watch_lose2:  mov ah, 02h
              mov dh, 00h
              mov dl, 00h 
              int 10h  
              mov ah, 09h
              mov dx, OFFSET msg_lose1
              int 21h   
              
              mov ah, 02h
              mov dh, 01h
              mov dl, 00h 
              int 10h  
              mov ah, 09h
              mov dx, OFFSET msg_lose2
              int 21h
              
              mov ah, 02h
              mov dh, 03h
              mov dl, 00h 
              int 10h  
              mov ah, 09h
              mov dx, OFFSET msg_lose3
              int 21h   
              
              mov ah, 07h
              int 21h
              
              cmp al, s
              je menu  
              jne watch_lose2                      
                                                          
msg_lose1 db "C'est dommage tu as perdu !                             $"
msg_lose2 db "Retourne t'entrainer un peu.                            $"
msg_lose3 db "Appuyez sur 's' pour retourner au menu.                 $"                                     
                            
             
;-------------------
;Parce qu'on a toujours besoin d'effacer l'ecran ! 
;-------------------
eff_ecran:   
          mov ah, 02h
          mov dh, 00h
          mov dl, 00h
          int 10h          
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h  
          
          mov ah, 02h
          mov dh, 01h
          mov dl, 00h
          int 10h          
          mov ah, 09h
          mov al, '\'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
                   
          mov ah, 02h
          mov dh, 02h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 03h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '\'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 05h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, ')'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h   
          
          mov ah, 02h
          mov dh, 06h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '('
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h
          
          mov ah, 02h
          mov dh, 08h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '-'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 09h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 10
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '('
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h
          
          mov ah, 02h
          mov dh, 11
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, ')'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 12
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h
          
          mov ah, 02h
          mov dh, 13
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '\'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h
          
          mov ah, 02h
          mov dh, 14
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
           mov ah, 02h
          mov dh, 15
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '>'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 16
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '<'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h 
          
          mov ah, 02h
          mov dh, 17
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '^'
          mov bh, 0
          mov cx, 80
          mov bl, couleur
          int 10h  
          
         
          call eff_ecran2      
               
             
          
          
     


eff_ecran2: 
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
      mov dh, 10
      mov dl, 00h 
      int 10h  
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 11
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      mov ah, 02h
      mov dh, 12
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h   
      
      mov ah, 02h
      mov dh, 13
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 14
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 15
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h
      
      mov ah, 02h
      mov dh, 16
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h     
      
      mov ah, 02h
      mov dh, 17
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_vide
      int 21h 
      
      cmp guitare, 1
      je affichage_guitare
      cmp ret_cho_mus, 1
      je choix_musique22
      cmp principal, 1
      je menu_principal
      cmp MENU_WATC0, 1
      je menu_watch
      cmp fin_watc0, 1
      je fin_watch  
      cmp fin_watc0, 2
      je menu
      cmp compteur_vie, 3
      je watch_lose2
      cmp num_efface, 2
      je fin_musique 
      cmp num_efface, 3
      je menu 
      cmp num_efface, 4
      je menu_watch
      
      


ligne_vide  db  "                                                                                     $"            



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

;---------------------------
EFFACE_NOTE:  mov ah, 02h
              mov dh, 04h
              mov dl, 00
              int 10h
                        
              mov ah, 09h
              mov dx, OFFSET notete_vide
              int 21h
              
              mov ah, 02h
              mov dh, 07h
              mov dl, 00h
              int 10h
                        
              mov ah, 09h
              mov dx, OFFSET note_vide
              int 21h 
              mov ah, 02h
              mov dh, 07h
              mov dl, 00h
              int 10h
              
              ret



;------------------------
;Implementation de la musique 1 ( Lettre a Elise) ! 
;------------------------                         
DO__T db 'r'
RE__T db 't'
MI__T db 'y'
SOL__T db 'i'
LA__T db 'o'


musique11: call EFFACE_NOTE 

           cmp watch, 1
           je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h
       
       
       mov ah, 07h
       int 21h  
              
       cmp al, MI_T
       je MI_T_EFF      
       jne verification  

musique12: call EFFACE_NOTE
        mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
           
       cmp watch, 1
       je RE_#
       
       mov ah, 09h
       mov dx, OFFSET RE__A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, RE__T
       je RE__T_EFF       
       jne verification

musique13:  call EFFACE_NOTE
cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification
       
musique14:   call EFFACE_NOTE
mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
               
       cmp watch, 1
       je RE_#
       
       mov ah, 09h
       mov dx, OFFSET RE__A
       int 21h 
       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, RE__T
       je RE__T_EFF       
       jne verification  

musique15: call EFFACE_NOTE
cmp watch, 1
       je MI
       
       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification

musique16:    call EFFACE_NOTE
cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h
       
       
       mov ah, 07h
       int 21h
       
       cmp al, SI_T
       je SI_T_EFF       
       jne verification
       
musique17:  call EFFACE_NOTE
cmp watch, 1
       je RE

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification  

musique18:       call EFFACE_NOTE
cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification

musique19: call EFFACE_NOTE
cmp watch, 1
       je LA
       
       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, LA_T
       je LA_T_EFF       
       jne verification
       
musique110: call EFFACE_NOTE
       cmp watch, 1
       je DO
        
       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h  
       
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification  

musique111:  call EFFACE_NOTE
cmp watch, 1
       je MI
        
       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h   
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification

musique112:   call EFFACE_NOTE
cmp watch, 1
       je LA
        
       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h  
       
       
       mov ah, 07h
       int 21h
       
       cmp al, LA_T
       je LA_T_EFF       
       jne verification 
       
musique113: call EFFACE_NOTE
cmp watch, 1
       je SI_
        
       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, SI_T
       je SI_T_EFF       
       jne verification  

musique114:  call EFFACE_NOTE
cmp watch, 1
       je MI
       
       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h    
       
    
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification

musique115: call EFFACE_NOTE
mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h

       cmp watch, 1
       je SOL_#
        
       mov ah, 09h
       mov dx, OFFSET SOL__A
       int 21h       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, SOL__T
       je SOL__T_EFF       
       jne verification
       
musique116:  call EFFACE_NOTE
cmp watch, 1
           je SI_
        
           mov ah, 09h
           mov dx, OFFSET SI_A
           int 21h       
           
           
           mov ah, 07h
           int 21h
           
           cmp al, SI_T
           je SI_T_EFF       
           jne verification  
           
musique117:   call EFFACE_NOTE
cmp watch, 1
           je DO
        
           mov ah, 09h
           mov dx, OFFSET DO_A
           int 21h       
           
           
           mov ah, 07h
           int 21h
           
           cmp al, DO_T
           je DO_T_EFF       
           jne verification  
           
musique118:     cmp watch, 1
                je add_watch_note
                call eff_musique
       
;------------------------
;Implementation de la musique 2 (Tetris) ! 
;------------------------          

musique21: call EFFACE_NOTE
 cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h
       
       
       mov ah, 07h
       int 21h  
              
       cmp al, MI_T
       je MI_T_EFF      
       jne verification  

musique22: call EFFACE_NOTE
cmp watch, 1
       je SI_
       
       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, SI_T
       je SI_T_EFF       
       jne verification

musique23:  call EFFACE_NOTE
cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification
       
musique24: call EFFACE_NOTE
cmp watch, 1
       je RE
       
       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h 
       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification  

musique25:   call EFFACE_NOTE
cmp watch, 1
       je DO
       
       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification

musique26: call EFFACE_NOTE
cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h
       
       
       mov ah, 07h
       int 21h
       
       cmp al, SI_T
       je SI_T_EFF       
       jne verification
       
musique27:   call EFFACE_NOTE
cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, LA_T
       je LA_T_EFF       
       jne verification  

musique28: call EFFACE_NOTE
cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, LA_T
       je LA_T_EFF       
       jne verification

musique29:call EFFACE_NOTE 
cmp watch, 1
       je DO
       
       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification
       
musique210:call EFFACE_NOTE
       cmp watch, 1
       je MI
        
       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h  
       
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification  

musique211:call EFFACE_NOTE
cmp watch, 1
       je RE
        
       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h   
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification

musique212: call EFFACE_NOTE
cmp watch, 1
       je DO
        
       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h  
       
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification 
       
musique213:  call EFFACE_NOTE
cmp watch, 1
       je SI_
        
       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, SI_T
       je SI_T_EFF       
       jne verification  

musique214:call EFFACE_NOTE
cmp watch, 1
       je DO
       
       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h    
       
       cmp watch, 1
       je DO
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification

musique215: call EFFACE_NOTE
cmp watch, 1
       je RE
        
       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification   
       
musique216: call EFFACE_NOTE
cmp watch, 1
           je MI
        
       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification 
       
musique217: call EFFACE_NOTE
cmp watch, 1
           je DO
        
       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, DO_T
       je DO_T_EFF       
       jne verification 
       
musique218: call EFFACE_NOTE
cmp watch, 1
           je LA
        
       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, LA_T
       je LA_T_EFF       
       jne verification
       
musique219: call EFFACE_NOTE
cmp watch, 1
           je LA
        
           mov ah, 09h
           mov dx, OFFSET LA_A
           int 21h       
           
           
           mov ah, 07h
           int 21h
           
           cmp al, LA_T
           je LA_T_EFF       
           jne verification 
           
musique220:cmp watch, 1
                je add_watch_note 
           call eff_musique
       
       
;------------------------
;Implementation de la musique 3 Danse Hongroise ! 
;------------------------          

musique31: call EFFACE_NOTE
           cmp watch, 1
       je DO_#  
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h

       mov ah, 09h
       mov dx, OFFSET DO__A
       int 21h
       
       
       mov ah, 07h
       int 21h  
              
       cmp al, DO__T
       je DO__T_EFF      
       jne verification  

musique32: call EFFACE_NOTE
cmp watch, 1
       je MI_#  
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
       
       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, MI__T
       je MI__T_EFF       
       jne verification

musique33: call EFFACE_NOTE
cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h
       
       mov ah, 07h
       int 21h
       
       cmp al, LA_T
       je LA_T_EFF       
       jne verification
       
musique34:  call EFFACE_NOTE
 cmp watch, 1
       je MI_#  
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
       
       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h 
       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, MI__T
       je MI_T_EFF       
       jne verification  

musique35: call EFFACE_NOTE
cmp watch, 1
       je FA
       
       mov ah, 09h
       mov dx, OFFSET FA_A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, FA_T
       je FA_T_EFF       
       jne verification

musique36: call EFFACE_NOTE
cmp watch, 1
       je MI_#   
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h
       
       
       mov ah, 07h
       int 21h
       
       cmp al, MI__T
       je MI__T_EFF       
       jne verification
       
musique37: call EFFACE_NOTE
 cmp watch, 1
       je SOL_#  
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h

       mov ah, 09h
       mov dx, OFFSET SOL__A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, SOL__T
       je SOL__T_EFF       
       jne verification  

musique38:call EFFACE_NOTE 
cmp watch, 1
       je MI_#   
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, MI__T
       je MI__T_EFF       
       jne verification

musique39: call EFFACE_NOTE
cmp watch, 1
       je SOL_#   
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
       
       mov ah, 09h
       mov dx, OFFSET SOL__A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, SOL__T
       je SOL__T_EFF       
       jne verification
       
musique310:call EFFACE_NOTE
       cmp watch, 1
       je MI_#      
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
        
       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h  
       
       
       mov ah, 07h
       int 21h
       
       cmp al, MI__T
       je MI__T_EFF       
       jne verification  

musique311: call EFFACE_NOTE
cmp watch, 1
       je RE
        
       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h   
       
       mov ah, 07h
       int 21h
       
       cmp al, RE_T
       je RE_T_EFF       
       jne verification

musique312: call EFFACE_NOTE
cmp watch, 1
       je MI
        
       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h  
       
       
       mov ah, 07h
       int 21h
       
       cmp al, MI_T
       je MI_T_EFF       
       jne verification 
       
musique313: call EFFACE_NOTE
cmp watch, 1
       je MI_#   
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
        
       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h 
       
       mov ah, 07h
       int 21h
       
       cmp al, MI__T
       je MI__T_EFF       
       jne verification  

musique314:call EFFACE_NOTE
cmp watch, 1
       je DO_#   
       
       mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
       
       mov ah, 09h
       mov dx, OFFSET DO__A
       int 21h    
       
       mov ah, 07h
       int 21h
       
       cmp al, DO__T
       je DO__T_EFF       
       jne verification

musique315: call EFFACE_NOTE
cmp watch, 1
       je SI_
        
       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h       
       
       
       mov ah, 07h
       int 21h
       
       cmp al, SI_T
       je SI_T_EFF       
       jne verification 
       
musique316:call EFFACE_NOTE
cmp watch, 1
           je LA
        
           mov ah, 09h
           mov dx, OFFSET LA_A
           int 21h       
           
           
           mov ah, 07h
           int 21h
           
           cmp al, LA_T
           je LA_T_EFF       
           jne verification  
           
musique317: call EFFACE_NOTE
cmp watch, 1
           je LA
        
           mov ah, 09h
           mov dx, OFFSET LA_A
           int 21h       
           
           
           mov ah, 07h
           int 21h
           
           cmp al, LA_T
           je LA_T_EFF       
           jne verification 
           
musique318:call EFFACE_NOTE
cmp watch, 1
           je DO_#
           
           mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
        
           mov ah, 09h
           mov dx, OFFSET DO__A
           int 21h       
           
           
           mov ah, 07h
           int 21h
           
           cmp al, DO__T
           je DO__T_EFF       
           jne verification
           
musique319: call EFFACE_NOTE
cmp watch, 1
           je MI_#    
           
           mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
        
           mov ah, 09h
           mov dx, OFFSET MI__A
           int 21h       
           
           
           mov ah, 07h
           int 21h
           
           cmp al, MI__T
           je MI__T_EFF       
           jne verification 
           
           
musique320: cmp watch, 1
                je add_watch_note
            call eff_musique
       
          
;-------------------------------
;Renvoie des musique par note.
;-------------------------------

note1:  cmp cho_musique, 1
        je musique11
        cmp cho_musique, 2
        je musique21
        cmp cho_musique, 3
        je musique31  
       
note2:  cmp cho_musique, 1
        je musique12
        cmp cho_musique, 2
        je musique22
        cmp cho_musique, 3
        je musique32
        
note3:  cmp cho_musique, 1
        je musique13
        cmp cho_musique, 2
        je musique23
        cmp cho_musique, 3
        je musique33
        
note4:  cmp cho_musique, 1
        je musique14
        cmp cho_musique, 2
        je musique24
        cmp cho_musique, 3
        je musique34 
        
note5:  cmp cho_musique, 1
        je musique15
        cmp cho_musique, 2
        je musique25
        cmp cho_musique, 3
        je musique35  
        
note6:  cmp cho_musique, 1
        je musique16
        cmp cho_musique, 2
        je musique26
        cmp cho_musique, 3
        je musique36  
       
note7:  cmp cho_musique, 1
        je musique17
        cmp cho_musique, 2
        je musique27
        cmp cho_musique, 3
        je musique37
        
note8:  cmp cho_musique, 1
        je musique18
        cmp cho_musique, 2
        je musique28
        cmp cho_musique, 3
        je musique38
        
note9:  cmp cho_musique, 1
        je musique19
        cmp cho_musique, 2
        je musique29
        cmp cho_musique, 3
        je musique39 
        
note10:  cmp cho_musique, 1
        je musique110
        cmp cho_musique, 2
        je musique210
        cmp cho_musique, 3
        je musique310  
        
note11:  cmp cho_musique, 1
        je musique111
        cmp cho_musique, 2
        je musique211
        cmp cho_musique, 3
        je musique311  
        
note12:  cmp cho_musique, 1
        je musique112
        cmp cho_musique, 2
        je musique212
        cmp cho_musique, 3
        je musique312
        
note13:  cmp cho_musique, 1
        je musique113
        cmp cho_musique, 2
        je musique213
        cmp cho_musique, 3
        je musique313
        
note14:  cmp cho_musique, 1
        je musique114
        cmp cho_musique, 2
        je musique214
        cmp cho_musique, 3
        je musique314
        
note15:  cmp cho_musique, 1
        je musique115
        cmp cho_musique, 2
        je musique215
        cmp cho_musique, 3
        je musique315  
        
note16:  cmp cho_musique, 1
        je musique116
        cmp cho_musique, 2
        je musique216
        cmp cho_musique, 3
        je musique316
        
note17:  cmp cho_musique, 1
        je musique117
        cmp cho_musique, 2
        je musique217
        cmp cho_musique, 3
        je musique317
        
note18:  cmp cho_musique, 1
        je musique118
        cmp cho_musique, 2
        je musique218
        cmp cho_musique, 3
        je musique318 
        
note19:  
        cmp cho_musique, 2
        je musique219
        cmp cho_musique, 3
        je musique319
        
note20:  
        cmp cho_musique, 2
        je musique220
        cmp cho_musique, 3
        je musique320               
             
       
       
       
       
;-------------------------------
;Note pour le watch.
;-------------------------------

note_watch1:    cmp cho_musique, 1
                je musique_watch11
                cmp cho_musique, 2
                je musique_watch21
                cmp cho_musique, 3
                je musique_watch31  

note_watch2: cmp cho_musique, 1
                je musique_watch12
                cmp cho_musique, 2
                je musique_watch22
                cmp cho_musique, 3
                je musique_watch32  
             
note_watch3: cmp cho_musique, 1
                je musique_watch13
                cmp cho_musique, 2
                je musique_watch23
                cmp cho_musique, 3
                je musique_watch33 
             
note_watch4: cmp cho_musique, 1
                je musique_watch14
                cmp cho_musique, 2
                je musique_watch24
                cmp cho_musique, 3
                je musique_watch34 
             
note_watch5: cmp cho_musique, 1
                je musique_watch15
                cmp cho_musique, 2
                je musique_watch25
                cmp cho_musique, 3
                je musique_watch35 
note_watch6: cmp cho_musique, 1
                je musique_watch16
                cmp cho_musique, 2
                je musique_watch26
                cmp cho_musique, 3
                je musique_watch36
             
note_watch7: cmp cho_musique, 1
                je musique_watch17
                cmp cho_musique, 2
                je musique_watch27
                cmp cho_musique, 3
                je musique_watch37 
             
note_watch8: cmp cho_musique, 1
                je musique_watch18
                cmp cho_musique, 2
                je musique_watch28
                cmp cho_musique, 3
                je musique_watch38 

note_watch9: cmp cho_musique, 1
                je musique_watch19
                cmp cho_musique, 2
                je musique_watch29
                cmp cho_musique, 3
                je musique_watch39  
                
note_watch10: cmp cho_musique, 1
                je musique_watch110
                cmp cho_musique, 2
                je musique_watch210
                cmp cho_musique, 3
                je musique_watch310 
             
note_watch11: cmp cho_musique, 1
                je musique_watch111
                cmp cho_musique, 2
                je musique_watch211
                cmp cho_musique, 3
                je musique_watch311
                 
note_watch12: cmp cho_musique, 1
                je musique_watch112
                cmp cho_musique, 2
                je musique_watch212
                cmp cho_musique, 3
                je musique_watch312  
             
note_watch13: cmp cho_musique, 1
                je musique_watch113
                cmp cho_musique, 2
                je musique_watch213
                cmp cho_musique, 3
                je musique_watch313 
              
             
note_watch14: cmp cho_musique, 1
                je musique_watch114
                cmp cho_musique, 2
                je musique_watch214
                cmp cho_musique, 3
                je musique_watch314  
             

note_watch15: cmp cho_musique, 1
                je musique_watch115
                cmp cho_musique, 2
                je musique_watch215
                cmp cho_musique, 3
                je musique_watch315 
                 
note_watch16: cmp cho_musique, 1
                je musique_watch116
                cmp cho_musique, 2
                je musique_watch216
                cmp cho_musique, 3
                je musique_watch316
                
note_watch17: cmp cho_musique, 1
                je musique_watch117
                cmp cho_musique, 2
                je musique_watch217
                cmp cho_musique, 3
                je musique_watch317
                
note_watch18: cmp cho_musique, 1
                je musique_watch118
                cmp cho_musique, 2
                je musique_watch218
                cmp cho_musique, 3
                je musique_watch318
                
note_watch19: cmp cho_musique, 1
                je musique_watch119
                cmp cho_musique, 2
                je musique_watch219
                cmp cho_musique, 3
                je musique_watch319
                
note_watch20: cmp cho_musique, 1
                je musique_watch120
                cmp cho_musique, 2
                je musique_watch220
                cmp cho_musique, 3
                je musique_watch320                                                                             
             
;---------------------
;Chanson Lettre a Elise
;---------------------      
             
musique_watch11: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification  
                 
musique_watch12: mov ah, 07h
                 int 21h
                 cmp al, RE__T
                 je RE__T_EFF
                 jne verification
                 
musique_watch13: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification
                 
musique_watch14: mov ah, 07h
                 int 21h
                 cmp al, RE__T
                 je RE__T_EFF
                 jne verification
                 
musique_watch15: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification  
                 
musique_watch16: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification  
                 
musique_watch17: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification
                 
musique_watch18: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                 
musique_watch19: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch110: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                                  
musique_watch111: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification  
                 
musique_watch112: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch113: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification
                 
musique_watch114: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification
                 
musique_watch115: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification  
                 
musique_watch116: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification  
                 
musique_watch117: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                 
musique_watch118: call fin_watc
                 
musique_watch119: call fin_watc
                 
musique_watch120: call fin_watc
                                  
;---------------------------------
;Chanson de tetris! 
;---------------------------------

musique_watch21: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification  
                 
musique_watch22: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification
                 
musique_watch23: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                 
musique_watch24: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification
                 
musique_watch25: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification  
                 
musique_watch26: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification  
                 
musique_watch27: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch28: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch29: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                 
musique_watch210: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification
                                  
musique_watch211: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification  
                 
musique_watch212: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                 
musique_watch213: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification
                 
musique_watch214: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                 
musique_watch215: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification  
                 
musique_watch216: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification  
                 
musique_watch217: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification
                 
musique_watch218: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch219: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch220: call fin_watc 
                 
;----------------------------
;Chanson marche 
;----------------------------

musique_watch31: mov ah, 07h
                 int 21h
                 cmp al, DO__T
                 je DO__T_EFF
                 jne verification  
                 
musique_watch32: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification
                 
musique_watch33: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch34: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification
                 
musique_watch35: mov ah, 07h
                 int 21h
                 cmp al, FA_T
                 je FA_T_EFF
                 jne verification  
                 
musique_watch36: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification  
                 
musique_watch37: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification
                 
musique_watch38: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification
                 
musique_watch39: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification
                 
musique_watch310: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification
                                  
musique_watch311: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification  
                 
musique_watch312: mov ah, 07h
                 int 21h
                 cmp al, DO__T
                 je DO__T_EFF
                 jne verification
                 
musique_watch313: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification
                 
musique_watch314: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification
                 
musique_watch315: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification  
                 
musique_watch316: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification  
                 
musique_watch317: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification
                 
musique_watch318: mov ah, 07h
                 int 21h
                 cmp al, DO__T
                 je DO__T_EFF
                 jne verification
                 
musique_watch319: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification
                 
musique_watch320: call fin_watc   



;------------------------
;Creation de la guitare ! 
;------------------------
guitare db 0

menu_guitare: mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g2
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g3
      int 21h   
      
      mov ah, 02h
      mov dh, 03h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g4
      int 21h
      
      mov ah, 02h
      mov dh, 04h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g5
      int 21h  
      
      mov ah, 02h
      mov dh, 05h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g6
      int 21h 
      
              mov guitare, 1
              mov ah, 07h
              int 21h   
              cmp al, s
              je eff_ecran
              jne menu_guitare
             
message_g db  "Bonjour, bienvenue dans cet add-on !                    $ "
message_g2 db "Ici vous allez pouvoir jouer de la guitare            $"
message_g3 db "Appuyez sur 's' pour demarrer                    $"        
message_g4 db "Et appuyez a tout moment sur 'a' pour quitter$"
message_g5 db "                                                    $"   
message_g6 db "                                                     $ "
             
fin_guitare: mov guitare, 0
             call eff_ecran       
             
affichage_guitare:   

mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g1
      int 21h 
      
      mov ah, 02h
      mov dh, 01h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g2
      int 21h 
      
      mov ah, 02h
      mov dh, 02h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g3
      int 21h   
      
      mov ah, 02h
      mov dh, 03h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g4
      int 21h
      
      mov ah, 02h
      mov dh, 04h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g5
      int 21h 
      
      mov ah, 02h
      mov dh, 05h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g6
      int 21h
            
      mov ah, 02h
      mov dh, 06h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g7
      int 21h 
      
      mov ah, 02h
      mov dh, 07h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g8
      int 21h   
      
      mov ah, 02h
      mov dh, 08h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g9
      int 21h
      
      mov ah, 02h
      mov dh, 09h
      mov dl, 00h 
      int 10h
      mov ah, 09h
      mov dx, OFFSET ligne_g10
      int 21h  
      
      call guitare_jeux

ligne_g1  db "    _______________                              $"
ligne_g2  db "   /               \                             $"
ligne_g3  db "  /______e--------- \               []_[]_[]     $"
ligne_g4  db " / ______d---------  \_____________/        \    $"
ligne_g5  db "(  ______c---------                          |   $"
ligne_g6  db "(  ______v---------   ______________  _  _  /    $"
ligne_g7  db " \ ______b---------  /              [] [] []     $"
ligne_g8  db "  \                 /                            $"
ligne_g9  db "   \_______________/                             $"
ligne_g10 db "                                                 $"    


guitare_jeux: mov ah, 07h
              int 21h
              cmp al, e
              je e_guit
              cmp al, d
              je d_guit
              cmp al, c
              je c_guit
              cmp al, v
              je v_guit
              cmp al, b 
              je b_guit
              cmp al, a
              je guit_fin 
              jne guitare_jeux
 
e_guit:   call guit_eff
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 02h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, rouge
          int 10h 
          
          call guitare_jeux   
          
d_guit:   call guit_eff
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 03h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, rouge
          int 10h 
          
          call guitare_jeux
                             
c_guit:   call guit_eff
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, rouge
          int 10h 
          
          call guitare_jeux
          
v_guit:   call guit_eff
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 05h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, rouge
          int 10h 
          
          call guitare_jeux  
          
b_guit:   call guit_eff
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 06h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, rouge
          int 10h 
          
          call guitare_jeux
                  
                  
guit_eff: mov ah, 02h
          mov dh, 02h
          mov dl, 00h 
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_g3
          int 21h   
          
          mov ah, 02h
          mov dh, 03h
          mov dl, 00h 
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_g4
          int 21h
          
          mov ah, 02h
          mov dh, 04h
          mov dl, 00h 
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_g5
          int 21h 
          
          mov ah, 02h
          mov dh, 05h
          mov dl, 00h 
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_g6
          int 21h
                
          mov ah, 02h
          mov dh, 06h
          mov dl, 00h 
          int 10h
          mov ah, 09h
          mov dx, OFFSET ligne_g7
          int 21h 
          
          ret   

guit_fin: mov guitare, 0
          call eff_ecran     
