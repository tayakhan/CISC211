# Flowchart

<img width="281" height="381" alt="Pro drawio" src="https://github.com/user-attachments/assets/8b220e8a-1780-4309-8977-64508115331b" />


# Challenges

- I realized that sys_write needs a memory address in the ECX register, not just the character itself. This meant I had to store the character in the .data section instead of just keeping it in a register.
- I had to be careful with how procedures work. If you forget the ret instruction at the end of the procedure, the program doesn’t know how to get back to the main loop, which leads to a crash.
- Keeping track of which register does what, like EAX for the syscall number vs EBX for the file descriptor, took some practice.
Getting these mixed up usually means the program runs but doesn’t actually show anything on the screen.
- I had to make sure the loop stopped exactly at ‘Z’. Using jg ensured that ‘Z’ still gets printed before the loop terminates.
