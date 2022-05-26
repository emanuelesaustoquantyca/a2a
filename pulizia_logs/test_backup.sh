backup_count=$(ls -ltr /app/replicate_data/ | grep bkp_replicate_ | wc -l)

if (($backup_count > 2))
    then
        echo "Ci sono più di due cartelle"
    else
        echo "Ce ne sono 2 o meno"
fi