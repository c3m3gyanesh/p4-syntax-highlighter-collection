# p4 syntax highlighter collection 
The syntax highlighting for P4 is available for VIM, EMACS and Sublime Text 2/3. 

## Sublime Text Editor
You can install the p4-syntax-highlighter package in SublimeText from the package control.

## VIM/EMACS Editor
1. For EMACS:
      - Copy the P4.el file to the appropriate directory of EMACS on your system.  
2. For VIM 3 methods are available.
      - Copy both "ftdetect" & "syntax" directory inside "~/.vim/" on your system.
      - To use with Vundle plug-in manager, add the following line to your bundle configuration file:  
        ```Bundle 'c3m3gyanesh/p4-syntax-highlighter-collection', {'rtp': 'vim'}```.
      - Use the install script:  
        ```curl -o- -L https://raw.githubusercontent.com/c3m3gyanesh/p4-syntax-highlighter-collection/master/vim/install.sh | bash```.

## How to Contribute? 
* To contribute to the syntax highlighter for VIM and EMACS, please fork this current repo and update the corresponding files. 
* To contribute to the syntax highlighter for Sublime Text editor, please fork the "https://github.com/c3m3gyanesh/p4-syntax-highlighter.git" project and make your changes.

#### NOTES
* The Syntax file for VIM and EMACS were created by the following developers. I found them in the mailing list of P4.

1. EMACS - Vladimir Gurevich
2. VIM   - Antonin Bas
