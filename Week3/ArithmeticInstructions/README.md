# Flowchart for the most complex Task 4

<img width="281" height="301" alt="Arithmetic drawio" src="https://github.com/user-attachments/assets/a2736a38-dc91-4485-8d44-677af79dbc32" />

# Challenges

The biggest challenge I faced was setting up the environment. I am loaning a Macbook and its architecture is different from the Intel x86 architecture required for this lab.
To fix this, I had to find out how to use Docker to create a Linux environment that could emulate an Intel processor.


Another issue was using the debugger, GDB. Because I was running the code through an emulator, I kept getting input/output errors when trying to view the registers in the visual layout. 
I had to learn how to bypass these errors by using the privileged mode in Docker and checking the registers manually using text commands instead of the visual window.


Also, I had to learn the specific requirements for division in Assembly. I discovered that you cannot just use the division instruction by itself, you first have to use the cqo command to prepare the registers. 
Once I understood how the CPU handles these different math steps, the logic for the equations became much clearer.
