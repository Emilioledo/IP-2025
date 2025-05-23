# 1.1
def pertenece(s: list[int], e: int) -> bool:
    for i in s:
        if (i == e):
            return True
    return False
        
def pertenece2(s: list[int], e: int) -> bool:
    i:int = 0
    while (i < len(s)):
        if (s[i] == e):
            return True
        i = i + 1
    return False
            

def pertenece3(s: list[int], e: int) -> bool:
    if (len(s) == 0):
        return False
    if (s[0] == e):
        return True
    else:
        return pertenece3(s[1:], e)

# 1.2
def divide_a_todos(s: list[int], e: int) -> bool:
    for i in s:
        if (i % e != 0):
            return False
    return True

# 1.3
def suma_total(s: list[int]) -> int:
    resultado: int = 0 
    for i in s:
        resultado = resultado + i
    return resultado

# 1.4
def maximo(s: list[int]) -> int:
    resultado: int = 0
    for i in s:
        if (i > resultado):
            resultado = i
    return resultado

# 1.5
# def minimo(s: list[int]) -> int:
#     resultado: int
#     for i in s:
#         if (i < resultado):
#             resultado = i
#     return resultado

# 1.6
def ordenados(s: list[int]) -> bool:
    primer_elemento = s[0]
    for i in s[1:]:
        if (primer_elemento + 1 == i):
            primer_elemento = i
        else:
            return False
    return True

# 1.9
def long_mayor_a_siete(s: list[str]) -> bool:
    for palabra in s:
        if (len(palabra) > 7):
            return True
    return False

# 1.14
def digitos_n(s: int) -> list[int]:
    return [int(d) for d in str(abs(s))]

def cantidad_digitos_impares(s: list[int]) -> int:
    contador: int = 0
    for n in s:
        digitos = digitos_n(n)
        for d in digitos:
            if(d % 2 != 0):
                contador += 1 
    return contador

# 2.3
def sin_vocales(s: list[str]) -> list[str]:
    vocales = 'aeiouAEIOU'
    return [''.join([letra for letra in frase if letra not in vocales]) for frase in s]

# 2.5
def da_vuelta_str(s: list[str]) -> list[str]:
    resultado: list[str] = []
    for frase in s:
        vuelta_frase: str = ''
        for letra in frase:
            vuelta_frase = letra + vuelta_frase    
        resultado.append(vuelta_frase)
    return resultado

# def eliminar_repetidos(s: list[str]) -> list[str]:
#     resultado: list[str] = []
#     for frase in s:
#         frase_sin_repetidos: str = ''
#         for letra in frase:
#             if letra in frase[1:]:
#                 frase_sin_repetidos = frase_sin_repetidos + ''
#                 print('letra repetida')
#             else:
#                 frase_sin_repetidos = frase_sin_repetidos + letra
#                 print('letra sin repetir')
#         resultado.append(frase_sin_repetidos)
#     return resultado
                
# 3
def todas_materias_son_mayor_4(n: list[int]) -> bool:
    for i in n:
        if (i < 4):
            return False
    return True

def promedio_notas(n: list[int]) -> float:
    notas: int = 0
    for i in n:
        notas = notas + i
    return notas / len(n)

def resultado_materia(n: list[int]) -> int:
    if (todas_materias_son_mayor_4(n) and promedio_notas(n) >= 7):
        return 1
    elif (todas_materias_son_mayor_4(n) and (promedio_notas(n) > 4 and promedio_notas(n) < 7)):
        return 2
    else:
        return 3

# 4
# Devolver saldo actual -> I = ingreso, R = retiro
# [("I o R", monto)]
def saldoActual(s: list[tuple[str, int]]) -> int:
    saldo: int = 0
    for tipo, monto in s:
        if tipo == 'I':
            saldo = saldo + monto
        if tipo == 'R':
            saldo = saldo - monto
    return saldo

# 5
#  [[1, 2, 3], [4, 5], [], [2, 3, 4]]
def pertenece_a_cada_uno_version_1(s: list[list[int]], e: int) -> list[bool]:
    resultado: list[bool] = []
    for fila in s:
        lo_incluye = fila.__contains__(e)
        resultado.append(lo_incluye)
    print(resultado)

# 6.1
def es_matriz(s: list[list[int]]) -> bool:
    elementos_fila: list[int] = []
    for fila in s:
        elementos_fila.append(len(fila))

    primer_elemento_fila: int = elementos_fila[0]
    for elemento in elementos_fila:
        if elemento != primer_elemento_fila:
            return False
        else:
            primer_elemento_fila = elemento
    return True

# 6.2
def fila_ordenadas(s: list[list[int]]) -> list[bool]:
    if(es_matriz(s)):
        resultado: list[bool] = []
        for fila in s:
            if(ordenados(fila)):
                resultado.append(True)
            else:
                resultado.append(False)
        return resultado

# 6.3
def columna(s: list[list[int]], c: int) -> list[int]:
    if(es_matriz(s)):
        elemento = s[c - 1]
        return elemento

# 6.6
def quien_gana_tateti(s: list[list[str]]) -> int:
    return

def main():
    # 1
    # print(pertenece([1, 2, 3], 3))
    # print(pertenece2([1, 2, 3], 4))
    # print(pertenece3([1, 2, 3], 4))
    # print(divide_a_todos([4, 8, 12], 4))
    # print(suma_total([4, 8, 12]))
    # print(maximo([4, 8, 12, 2, 128, 2]))
    # print(minimo([4, 8, 12, 2, 128, 2]))
    # print(ordenados(([4, 5, 7, 7, 8])))
    # print(long_mayor_a_siete(['termo', 'gato', 'tener', 'jirafas', 'rinoceronte']))
    # print(cantidad_digitos_impares([57, 2383, 812, 246]))

    # 2
    # print(sin_vocales(['Hola como estas?']))
    # print(da_vuelta_str(['Hola como estas?', 'Querido amigo']))
    # print(eliminar_repetidos(['Hola']))

    # 3
    # print(resultado_materia([7, 4, 6]))
    # 4
    # print(saldoActual([('I', 2000), ('R', 20), ('R', 1000), ('I', 300)]))
    # 5
    # pertenece_a_cada_uno_version_1([[1, 2, 3], [4, 5], [], [2, 3, 4]], 4)
    # 6
    # print(es_matriz([[1, 2, 3], [3, 4, 3], [1, 2, 3]]))
    # print(fila_ordenadas([[1, 2, 3], [3, 4, 3], [1, 2, 3]]))
    columna([[1, 2, 3], [3, 4, 3], [1, 2, 3]], 3)

main()
