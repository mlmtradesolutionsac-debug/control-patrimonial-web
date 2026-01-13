import sys
import time
from sqlalchemy import create_engine, text

TARGET_IP = "10.28.106.250"
USER = "patrimonio"
PASS = "T1C050p06769077"

def check_postgres():
    print(f"\n--- Checking PostgreSQL on {TARGET_IP}:5432 ---")
    # Intentar conectar a BD 'postgres' o 'patrimonio'
    dbs_to_try = ['postgres', 'patrimonio', 'template1']
    
    for db_name in dbs_to_try:
        try:
            uri = f"postgresql://{USER}:{PASS}@{TARGET_IP}:5432/{db_name}"
            print(f"Connecting to database '{db_name}'...")
            engine = create_engine(uri, connect_args={'connect_timeout': 5})
            with engine.connect() as conn:
                version = conn.execute(text("SELECT version();")).scalar()
                print(f"✅ SUCCESS! Connected to '{db_name}'")
                print(f"   Version: {version}")
                
                # Check metrics if possible
                try:
                    uptime = conn.execute(text("SELECT current_timestamp - pg_postmaster_start_time();")).scalar()
                    print(f"   Uptime: {uptime}")
                    
                    db_size = conn.execute(text(f"SELECT pg_size_pretty(pg_database_size('{db_name}'));")).scalar()
                    print(f"   DB Size: {db_size}")
                except:
                    pass
                return True
        except Exception as e:
            print(f"❌ Failed to connect to '{db_name}': {str(e).splitlines()[0]}")
    return False

def check_mysql():
    print(f"\n--- Checking MySQL on {TARGET_IP}:3306 ---")
    try:
        # Requiere driver mysqlclient o pymysql. Intentamos pymysql si está, o default.
        # URI form: mysql+pymysql://... or mysql://
        uri = f"mysql+pymysql://{USER}:{PASS}@{TARGET_IP}:3306/information_schema"
        print(f"Connecting to MySQL...")
        engine = create_engine(uri, connect_args={'connect_timeout': 5})
        with engine.connect() as conn:
            version = conn.execute(text("SELECT VERSION();")).scalar()
            print(f"✅ SUCCESS! Connected to MySQL")
            print(f"   Version: {version}")
            return True
    except Exception as e:
        print(f"❌ Failed to connect to MySQL: {str(e).splitlines()[0]}")
        return False

if __name__ == "__main__":
    print(f"Analyzing server {TARGET_IP} with user '{USER}'...")
    
    pg_found = False
    try:
        # Import psycopg2 to be sure
        import psycopg2
        pg_found = check_postgres()
    except ImportError:
        print("⚠️ psycopg2 driver not installed, skipping Postgres check (or install it)")
    except Exception as e:
        print(f"Error checking Postgres: {e}")

    if not pg_found:
        try:
            check_mysql()
        except:
             pass
