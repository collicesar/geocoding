import geopandas as gpd
from sqlalchemy import create_engine
from sqlalchemy.dialects.mysql import LONGTEXT

def geojson_to_db(con, filepath, filename, table_name):
    print(f"loading file: {filepath}/{filename}")
    gdf = gpd.read_file(f"{filepath}/{filename}")
    gdf.to_sql(table_name, con=con, if_exists='append', index=bool(False), dtype = {'geometry': LONGTEXT})
        

engine = create_engine("mysql+pymysql://root:password@localhost/geocoding?charset=utf8mb4")

filename = None
with engine.connect() as con:
    
    for x in range(1, 33):
        mcode = str(x).zfill(2)
        try:
            filename = f"{mcode}.json"
            geojson_to_db(con=con, filepath=f"../data/inegi/estados", filename=filename, table_name="inegi_estados")
            geojson_to_db(con=con, filepath=f"../data/inegi/municipios", filename=filename, table_name="inegi_municipios")
        except Exception as ex:
            print(f"failed: {filename}")
            print(repr(ex))
            
        
    
