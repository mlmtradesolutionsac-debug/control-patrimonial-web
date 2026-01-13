import mysql.connector
from mysql.connector import Error
import pandas as pd

def buscar_cal_2801():
    connection = None
    try:
        print("Conectando a la base de datos...")
        # Conexión a la base de datos
        connection = mysql.connector.connect(
            host='10.28.106.250',
            database='patrimonio',  # Asumiendo que el nombre de la BD es patrimonio
            user='patrimonio',
            password='T1C050p06769077'
        )

        if connection.is_connected():
            print("Conexión exitosa a la base de datos")
            cursor = connection.cursor()

            # Consulta para buscar registros que contengan CAL 2025 y 2801
            # Esta consulta buscará en todas las columnas de texto posibles
            query = """
            SELECT *
            FROM activos  -- Asumiendo que la tabla se llama 'activos', cambia si tiene otro nombre
            WHERE (
                CONCAT_WS(' ', serie, descripcion, observaciones, marca, modelo, num_inventario, codigo_bien, estado, ubicacion) LIKE '%CAL 2025%'
                OR
                CONCAT_WS(' ', serie, descripcion, observaciones, marca, modelo, num_inventario, codigo_bien, estado, ubicacion) LIKE '%2801%'
            )
            LIMIT 100;
            """

            print("Ejecutando consulta...")
            print("Consulta:", query)

            df = pd.read_sql(query, connection)
            print(f"Se encontraron {len(df)} registros que coinciden con los términos de búsqueda")

            if len(df) > 0:
                print("\nRegistros encontrados:")
                print(df.to_string(index=True))

                # Verificar si hay coincidencias exactas
                coincidencias_exactas = []
                for idx, row in df.iterrows():
                    row_str = ' '.join([str(val) if val is not None else '' for val in row.values])
                    if 'CAL 2025' in row_str.upper() and '2801' in row_str:
                        coincidencias_exactas.append(idx)

                if coincidencias_exactas:
                    print(f"\n¡Encontradas {len(coincidencias_exactas)} coincidencias exactas con ambos términos!")
                    for idx in coincidencias_exactas:
                        print(f"\nRegistro en fila {idx}:")
                        print(df.iloc[idx])
                else:
                    print("\nNo se encontraron coincidencias exactas donde aparezcan simultáneamente 'CAL 2025' y '2801'")
            else:
                print("No se encontraron registros con ninguno de los términos de búsqueda")

    except Error as e:
        print(f"Error al conectar a MySQL: {e}")
        print("Es posible que necesites ajustar el nombre de la tabla en la consulta SQL")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("Conexión a MySQL cerrada")

if __name__ == "__main__":
    buscar_cal_2801()