#!/bin/bash
first=$(sudo -i -u postgres bash -c "psql -q -t -d empresa -c \"SELECT MAX(id_empleat)+1 FROM public.historial_treballs;\"")
# Bucle
for i in {0..10}
do
    id=$(expr $first + $i)
    # sudo -i -u postgres bash -c "psql -c \"create database empresa;\""
    sudo -i -u postgres bash -c "psql -d empresa -c \"INSERT INTO public.historial_treballs(id_empleat, id_treball, data_inici, data_fi, id_departament) values($id, 'ST_CLERK', 'now()', 'now()', '50');\""
done

# Crear WAL
sudo -i -u postgres bash -c "psql -d empresa -c \"SELECT pg_switch_wal();\""
# psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER -W postgres -c "SELECT pg_switch_wal();"