import os

def leer_archivos_mp3():
    carpeta_actual = os.path.dirname(os.path.abspath(__file__))
    
    nombres_archivos = []
    
    for archivo in os.listdir(carpeta_actual):
        if archivo.endswith(".mp3"):
            nombres_archivos.append(f'"{archivo}"')
    
    nombres_string = ", ".join(nombres_archivos)
    
    return nombres_string

print(leer_archivos_mp3())
