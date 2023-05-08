import os

def leer_archivos_mp3():
    # Obtiene la ruta de la carpeta actual
    carpeta_actual = os.path.dirname(os.path.abspath(__file__))
    
    # Lista para almacenar los nombres de los archivos mp3
    nombres_archivos = []
    
    # Recorre todos los archivos y directorios en la carpeta actual
    for archivo in os.listdir(carpeta_actual):
        # Comprueba si el archivo tiene extensión .mp3
        if archivo.endswith(".mp3"):
            # Agrega el nombre del archivo a la lista
            nombres_archivos.append(f'"{archivo}"')
    
    # Crea un string con los nombres de los archivos separados por comas
    nombres_string = ", ".join(nombres_archivos)
    
    return nombres_string

# Ejecuta la función y muestra el resultado
print(leer_archivos_mp3())
