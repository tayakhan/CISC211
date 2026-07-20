# Flowchart

<img width="281" height="461" alt="F drawio" src="https://github.com/user-attachments/assets/d621dec6-3191-460e-ab81-bf96940fd14b" />

# Challenges

- I had to remember that the loop instruction automatically uses the ECX register. If I used ECX for something else inside the loop, it would break the counter.
- Since these are 32-bit integers (dd), each element is 4 bytes apart.
I had to ensure the index increment was add esi, 4 rather than add esi, 1 to point to the correct data.
- Calculating the 10th number requires careful tracking. Starting from 0 and 1, you have to loop exactly 9 times to arrive at the sum 55 in the result register.
