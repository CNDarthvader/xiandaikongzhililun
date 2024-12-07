import sympy as sp

def z_transform(sequence, n):
    z = sp.symbols('z')
    return sum(sequence[i] * z**(-i) for i in range(len(sequence)))

# 示例用法
sequence = [1, 2, 3, 4]  # 离散序列
n = sp.symbols('n')
z_transform_result = z_transform(sequence, n)
print(z_transform_result)