# Step Script Svecchiamento A2A:
## Individuare spazio prima della pulizia

#!/bin/sh

data=$(date +%d_%m_%Y)

date >> /root/log/log_$data

echo '' >> /root/log/log_$data

echo 'Spazio disponibile prima della pulizia' >> /root/log/log_$data
df -h >> /root/log/log_$data
echo '' >> /root/log/log_$data


echo 'Dimensioni sottocartelle prima della pulizia:' >> /root/log/log_$data
du -csh /app/ >> /root/log/log_$data
echo '' >> /root/log/log_$data

echo '---------------------------------------------------------------------------------------' >> /root/log/log_$data

echo '' >> /root/log/log_$data

echo 'Compressione Replicate Logs' >> /root/log/log_$data

echo '' >> /root/log/log_$data

#find /app/replicate_data/attunity/replicate/data/logs/* -mtime +30 -exec gzip -c *.log > /app/replicate_data/attunity/replicate/data/logs/replica_logs_$data.gz {} \; >> /root/log/log_$data 
find /app/replicate_data/attunity/replicate/data/logs/*.log -mtime +30 -exec gzip {} \; >> /root/log/log_$data 

echo '' >> /root/log/log_$data

echo 'Compressione Replicate Logs completata' >> /root/log/log_$data


echo '---------------------------------------------------------------------------------------' >> /root/log/log_$data

echo '' >> /root/log/log_$data

echo 'Pulizia Replicate Logs' >> /root/log/log_$data

echo '' >> /root/log/log_$data

find /app/replicate_data/attunity/replicate/data/logs/* -mtime +60 -exec  rm -f *.gz {} \; >> /root/log/log_$data 

echo '' >> /root/log/log_$data

echo 'Pulizia Replicate Logs Completata' >> /root/log/log_$data

echo '' >> /root/log/log_$data

echo '---------------------------------------------------------------------------------------' >> /root/log/log_$data

echo '' >> /root/log/log_$data

echo 'Spazio disponibile dopo la pulizia' >> /root/log/log_$data
df -h >> /root/log/log_$data
echo '' >> /root/log/log_$data

echo 'Dimensioni sottocartelle dopo pulizia:' >> /root/log/log_$data
du -csh /app/ >> /root/log/log_$data
echo '' >> /root/log/log_$data