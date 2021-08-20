import numpy as np
import struct

a=np.loadtxt("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/mul_result.txt",delimiter="\n",dtype="str")

mul_result=np.zeros(a.shape[0])
for i in range(a.shape[0]):
    mul_result[i]=struct.unpack('!f', bytes.fromhex(a[i]))[0]

mul=np.loadtxt("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/mul.txt",delimiter="\n",dtype="double")

count=sum(abs(mul-mul_result))/a.shape[0]

print(count)