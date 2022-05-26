#backup_count=$(ls -ltr /app/replicate_data/ | grep bkp_replicate_ | wc -l)
backup_count=$(ls -ltr /home/emanuele.sausto/ | grep bkp_replicate_ | wc -l)

echo "Le cartelle sono:"

echo ""

ls -ltr /home/emanuele.sausto/ | grep bkp_replicate_

echo ""

if (($backup_count > 2))
    then
        backup_count_less=$((backup_count - 2))
        backup_count_real=$backup_count_less
        echo "Ci sono più di due cartelle"
        echo $backup_count_real
        for (($backup_count_real > 0))
        do 
            echo "Ci sono $backup_count cartelle"
            deleted_folder = ls -ltr /home/emanuele.sausto/ | grep bkp_replicate_ head -n 1
            echo $deleted_folder
            rm -r /home/emanuele.sausto/$deleted_folder
            (($backup_count_real--))
        done
        echo $backup_count_real
    else
        echo "Ce ne sono 2 o meno cartelle"
fi