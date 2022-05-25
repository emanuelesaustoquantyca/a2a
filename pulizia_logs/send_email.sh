data=$(date +%d_%m_%Y)


echo 'From: "Supporto Quantyca" <supporto@quantyca.it>
To: "Emanuele Sausto" <emanuele.sausto@quantyca.it>
Subject: A2A | Svecchiamento Logs ' ${data}  > /root/mail

cat /root/log/log_$data >> /root/mail

curl --ssl-reqd \
  --url 'smtps://smtp.gmail.com:465' \
  --user 'supporto@quantyca.it:zdppuldaftzxldsr' \
  --mail-from 'supporto@quantyca.it' \
  --mail-rcpt 'emanuele.sausto@quantyca.it' \
  --upload-file /root/mail