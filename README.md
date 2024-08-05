# GEOCODING


### Data Extraction

Download geojson files from inegi
```bash
  cd etl
  ./extract-from-inegi.sh
```

### Load to MySQL

```bash
  cd etl
  python3 load-to-mysql.py
```

### Load to Postgresql

```bash
  cd etl
  python3 load-to-postgresql.py
```