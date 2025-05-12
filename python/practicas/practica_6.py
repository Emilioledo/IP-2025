import math

# 1.1
def imprimir_hola_mundo():
    print ('Hola Mundo!')

# 1.3
def raizDe2():
    return round(2 ** 0.5, 4)

# 1.4
def factorial_2():
    resultado: int = 1
    for x in range(1, 3):
        resultado = resultado * x

    return resultado    

# 1.5
def perimetro():
    return 2 * math.pi

# 2.1
def imprimir_saludo(saludo: str):
    print(f"Hola {saludo}")

# 2.2
def raiz_cuadrada(numero: int):
    return numero ** 0.5

# 2.3
def fahrenheit_a_celsius(temp_far: int) -> int:
    return ((temp_far - 32) * 5) / 9

# 2.4
def imprimir_dos_veces(estribillo: str):
    for _ in range(1, 3):
        print(estribillo)

# 2.7
def cantidad_de_pizzas(comensales: int, min_cantidad_porciones: int) -> int:
    return math.ceil((comensales * min_cantidad_porciones) / 8)

# 3.1
def alguno_es_0(num1: float, num2: float) -> bool:
    return num1 == 0 or num2 == 0  

# 3.2
def ambos_son_0(num1: float, num2: float) -> bool:
    return num1 == 0 and num2 == 0

# 3.3
def es_nombre_largo(nombre: str) -> bool:
    cantidad: int = 0
    for _ in nombre:
        cantidad = cantidad + 1
    return cantidad > 3 and cantidad < 8

def es_bisiesto(anio: int) -> bool:
    return anio % 400 == 0 or (anio % 4 == 0 and anio % 100 != 0)

def main ():
    # 1
    # imprimir_hola_mundo()
    # print(raizDe2())
    # print(factorial_2())
    # print(perimetro())

    # 2
    # imprimir_saludo('Emilio')
    # print(raiz_cuadrada(16))
    # print(fahrenheit_a_celsius(32))
    # imprimir_dos_veces('Hola como estás?')
    # print(cantidad_de_pizzas(12, 3))

    # 3
    # print(alguno_es_0(1, 0))
    # print(ambos_son_0(0, 0))
    # print(ambos_son_0(0, 0))
    # print(es_nombre_largo('Emilio'))
    # print(es_bisiesto(2001))
    return

main()