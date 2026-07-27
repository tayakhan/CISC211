# Flowchart

<img width="281" height="381" alt="Fun drawio" src="https://github.com/user-attachments/assets/9df2a1e8-4501-456d-845f-c2304ffa38cd" />

# Challenges

- Transitioning from simple procedures to functions required using the stack. I had to ensure that I pushed the value correctly and, more importantly, cleaned up the stack after the function call to prevent memory leaks or crashes.
- It was a bit tricky to remember the correct offset to find the passed value on the stack. Since the return address is pushed by the call instruction, I had to look at [ebp + 8] to find my number.
- I chose to use the test instruction because it is more efficient than division. It took a moment to realize that just checking the last bit of a binary number is enough to determine if it is even or odd.
- Setting up the base pointer was a new concept. It was necessary to ensure that the function could safely access its parameters regardless of other operations happening on the stack.
