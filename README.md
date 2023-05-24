# ![](./dhp-lotus.png) Fortune Dhammapada

The alternative to the "display-dhammapada" application is the "Dhammapada Fortune." It is a collection of Buddhist sayings and is available in CLI (Command Line Interface) and GUI (Graphical User Interface) modes. It supports the Gnome and KDE desktop environments.

The "Dhammapada Fortune" application utilizes the "fortune-mod" program to provide its functionality. It retrieves Dhammapada data from SuttaCentral.net, a popular online resource for Buddhist texts.

The application offers translations in 19 different languages and includes 25 translation cookies. The supported languages are Catalan, Czech, German, English, Spanish, French, Hebrew, Hungarian, Italian, Japanese, Marathi, Burmese, Dutch, Norwegian, Polish, Portuguese, Singhalese, Slovenian, and Tamil.

## Options
### Support 
- Zenity 
- Notify
- Kdialog
- Kdialog Popup

### Language List

	1. ca   Catalan            
    2. cs    Czech   
    3. nl    Dutch  
    4. en    English  
    5. fr    French   
    6. de    German   
    7. he    Hebrew   
    8. hu    Hungarian   
    9. it	 Italian   
    10. ja    Japanese   
    11. mr    Marathi   
    12. my    Myanmar   
    13. no    Norwegian
    14. pl    Polish   
    15. pt    Portuguese   
    16. si    Singhalese   
    17. sl    Slovenian   
    18. es    Spanish   
    19. ta    Tamil

### Usage
```
Usage:	fortune-dhp [-h] [ -l  CC | CC_AUTHOR  ]  
	[ -r search-content | ID ] [ -b  z | n | k | p |a ]

##################################################

-h, --help		Print this Help Infomation.
-l, --language		Use language code 
			CC | CC_AUTHOR 
-r, --regex		Search pattern and number

-b, --box		Use Gui
       z 	 - with Zenity
       n 	 - with Notify Popup
       k 	 - with Kdialog
       p 	 - with Kdialog Popup
       a 	 - with Auto Detect
-a               - same with   -b a 

##################################################


 LANGUAGE  CC  CC_AUTHOR 


  ca    Catalan         
        ca_jambudipa 
		ca_durall
  cs    Czech
  nl    Dutch
        nl_dubois 
		nl_loosbroek 
  en    English 
        en_anandajoti  
        en_buddharakkhita
        en_feldmeier
  fr    French
  de    German
  he    Hebrew
  hu    Hungarian
  it    Italian
  ja    Japanese
  mr    Marathi
  my    Myanmar
  no    Norwegian
  pl    Polish
  pt    Portuguese
        pl_becker 
		pt_beisert
        pt_guimaraes 
  si    Singhalese
  sl    Slovenian
  es    Spanish
  ta    Tamil
  ```

## Credit and Licence 

- fortune
- suttacentral.net 
- https://github.com/suttacentral
- [AUTHOR](./AUTHOR)


## Programming Language List

[ ] C

[ ] Go

[ ] Python

[x] Bash

## OS

[x] Linux

[ ] Windows

[ ] Mac

[ ] Android

[ ] iOS

