#backup_count=$(ls -ltr /app/replicate_data/ | grep bkp_replicate_ | wc -l)
backup_count=$(ls -ltr /home/emanuele.sausto/ | grep bkp_replicate_ | wc -l)

if (($backup_count > 2))
    then
        $backup_count_real='expr $backup_count - 2'
        echo "Ci sono più di due cartelle"
        echo $backup_count_real
    else
        echo "Ce ne sono 2 o meno"
fi