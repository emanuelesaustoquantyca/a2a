#backup_count=$(ls -ltr /app/replicate_data/ | grep bkp_replicate_ | wc -l)
backup_count=$(ls -ltr /home/emanuele.sausto/ | grep bkp_replicate_ | wc -l)

echo "Le cartelle sono:"

echo ""

ls -ltr /home/emanuele.sausto/ | grep bkp_replicate_

echo ""

if (($backup_count > 2))
    then
        backup_count=$((backup_count - 2))
        echo "Ci sono più di due cartelle"
        echo $backup_count
        for (($backup_count > 0))
        do 
            echo "Ci sono $backup_count cartelle"
            deleted_folder = ls -ltr /home/emanuele.sausto/ | grep bkp_replicate_ head -n 1
            echo $deleted_folder
            rm -r /home/emanuele.sausto/$deleted_folder
            (($backup_count--))
        done
        echo $backup_count
    else
        echo "Ce ne sono 2 o meno"
fi