import sys

idade = 25
altura = 1.75
letra = 'A'
salario = 5000.50

print("int:")
print("  Valor:   ", idade)
print("  Tamanho: ", sys.getsizeof(idade), "bytes")
print("  Endereço:", hex(id(idade)))
print()

print("float:")
print("  Valor:   ", altura)
print("  Tamanho: ", sys.getsizeof(altura), "bytes")
print("  Endereço:", hex(id(altura)))
print()

print("str:")
print("  Valor:   ", letra)
print("  Tamanho: ", sys.getsizeof(letra), "bytes")
print("  Endereço:", hex(id(letra)))
print()

print("float:")
print("  Valor:   ", salario)
print("  Tamanho: ", sys.getsizeof(salario), "bytes")
print("  Endereço:", hex(id(salario)))