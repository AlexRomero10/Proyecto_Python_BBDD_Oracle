from funciones import *

conexion = cx_Oracle.connect('proyecto', 'proyecto', 'localhost:1521/XE')


while True:
    opcion = MostrarMenu()

    if opcion == 1:
        print("")
        mostrar_empresas_por_localidad(conexion)
    elif opcion == 2:
        print("")
        subcadena = input("Introduce la subcadena para buscar los cargos: ")
        buscar_cargos(conexion, subcadena)
    elif opcion == 3:
        print("")
        nombre_empleado = input("Introduce el nombre del empleado: ")
        mostrar_area_trabajo_empleado(conexion, nombre_empleado)
    elif opcion == 4:
        cif = input("Introduce el cif de la empresa: ")
        nombre = input ("Introduce el nombre de la empresa: ")
        direccion = input ("Introduce la direccion de la empresa: ")
        localidad = input ("Introduce la localidad de la empresa: ")
        agregar_empresa(conexion, cif, nombre, direccion, localidad)
        actualizar_tabla_empresa(conexion)
    elif opcion == 5:
        print("")
        prefijo_a_eliminar = input("Introduce el prefijo que quieras eliminar: ")
        eliminar_personas_por_prefijo(conexion, prefijo_a_eliminar)
        actualizar_tabla_persona_contacto(conexion)
    elif opcion == 6:
        ID_AreaTrabajo = input("Introduce la ID del Area de Trabajo que desea actualizar: ")
        campo = input("Introduce el campo que desea actualizar (Nombre, Descripcion): ")
        nuevo_valor = input("Introduce el nuevo valor para el campo seleccionado: ")
        actualizar_area_trabajo(conexion, ID_AreaTrabajo, campo, nuevo_valor)
        actualizar_tabla_area_trabajo(conexion)
    elif opcion == 7:
        print("FIN DEL PROGRAMA")
        break
    else:
        print("Opcion no valida")