;
; Name: Tyler Davis
;
; This subroutine uses recursion to
; count the occurences of a character
; in a word
;
; Registers R0: Current character of
;               the word
;           R1: Character the program
;               is looking for
;           R2: Misc uses (described
;               in specific code blocks
;           R3: Same as R2
;           R5: Points to start of 
;               local variables
;           R6: Points to top of the
;               stack
;
            .ORIG       x3300

CHAR_COUNT
;
; Allocates space on the stack for
; return value, return addr, dyn link,
; and local variables
;
            ADD         R6, R6, #-1
            ADD         R6, R6, #-1
            STR         R7, R6, #0
            ADD         R6, R6, #-1
            STR         R5, R6, #0
            ADD         R5, R6, #-1
            ADD         R6, R6, #-1
;
; Loads the current character of the
; word into R0
;
            LDR         R0, R5, #4
            LDR         R0, R0, #0
;
; Checks if character is null which
; would indicate the end of the word
; (skips recursive call)
;
            ADD         R0, R0, #0
            BRnp        NotNull
            AND         R2, R2, #0
            STR         R2, R5, #0
            BRnzp       Return
;
; If the character is not null, the 
; character to compare is loaded and
; compared to the character in the word
;
NotNull     LDR         R1, R5, #5
            NOT         R3, R1
            ADD         R3, R3, #1
            ADD         R3, R3, R0
;
; If the characters match, the result
; is incremented and skips to the 
; recursive call
;
            BRnp        CharNotSame
            AND         R2, R2, #0
            ADD         R2, R2, #1
            STR         R2, R5, #0
            BRnzp       RecurCall
;
; If the characters do not match, result
; is set to 0 and kicks off recursive call
;
CharNotSame AND         R2, R2, #0
            STR         R2, R5, #0
;
; Recursive call to CHAR_COUNT, increments
; the character pointer and passes the 
; pointer and character to itself, when
; returns, the result is incremented by
; the return value
;
RecurCall   LDR         R3, R5, #5
            ADD         R6, R6, #-1
            STR         R3, R6, #0
            LDR         R2, R5, #4
            ADD         R2, R2, #1
            ADD         R6, R6, #-1
            STR         R2, R6, #0
            JSR         CHAR_COUNT
            LDR         R2, R6, #0
            LDR         R3, R5, #0
            ADD         R3, R2, R3
            STR         R3, R5, #0
            ADD         R6, R6, #1
            ADD         R6, R6, #2
;
; Places the return value in its place,
; pops local variable, places dyn link
; into R5, places return address 
; into R7, and returns
;
Return      LDR         R2, R5, #0
            STR         R2, R5, #3
            ADD         R6, R5, #1
            LDR         R5, R6, #0
            ADD         R6, R6, #1
            LDR         R7, R6, #0
            ADD         R6, R6, #1
            RET

            .END
