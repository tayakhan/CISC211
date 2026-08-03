# Challenges

- The biggest challenge was definitely figuring out the sys_lseek system call. At first, I didn’t realize that simply opening a file in write mode wouldn’t automatically put the cursor at the end, so I ended up overwriting my first two quotes instead of adding to them.
It took me a bit of debugging in GDB to realize I needed to explicitly move the pointer to the end of the file using the reference position 2.

- I wasn’t sure what number to use for the edx register when creating the file, but then, I learned that 0644q is standard for giving the owner read and write access.
- Keeping track of all the different register requirements for each system call, like eax for the call number and ebx for the file descriptor, required a lot of back-and-forth checking, but it def helped me understand how the Linux kernel interacts with our code.



