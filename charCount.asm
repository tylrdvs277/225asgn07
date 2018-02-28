            .ORIG       x3300

CHAR_COUNT  ADD         R6, R6, #-1
            ADD         R6, R6, #-1
            STR         R7, R6, #0
            ADD         R6, R6, #-1
            STR         R5, R6, #0
            ADD         R5, R6, #-1
            ADD         R6, R6, #-1

            LDR         R0, R5, #4
            LDR         R0, R0, #0

            ADD         R0, R0, #0
            BRnp        NotNull
            AND         R2, R2, #0
            STR         R2, R5, #0
            BRnzp       Return

NotNull     LDR         R1, R5, #5
            NOT         R3, R1
            ADD         R3, R3, #1
            ADD         R3, R3, R0
            BRnp        CharNotSame
            AND         R2, R2, #0
            ADD         R2, R2, #1
            STR         R2, R5, #0
            BRnzp       RecurCall

CharNotSame AND         R2, R2, #0
            STR         R2, R5, #0
            
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

Return      LDR         R2, R5, #0
            STR         R2, R5, #3
            ADD         R6, R5, #1
            LDR         R5, R6, #0
            ADD         R6, R6, #1
            LDR         R7, R6, #0
            ADD         R6, R6, #1

            RET

            .END
