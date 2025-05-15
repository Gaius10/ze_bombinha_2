jmp main

command: var #1

main:
    loadn r7, #'b'
    store command, r7

    load r0, command
    loadn r1, #1
    outchar r0, r1
    halt
