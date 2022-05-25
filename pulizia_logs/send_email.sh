data=$(date +%d_%m_%Y)


echo 'From: "Supporto A2A" <dataplatform.qdr@a2a.eu>
To: "Emanuele Sausto" <emanuele.sausto@quantyca.it>
Subject: A2A | Svecchiamento Logs ' ${data}  > /root/mail

cat /root/log/log_$data >> /root/mail

curl --ssl-reqd \
  --url 'smtps://smtpapp.group.local:25' \
  --user 'dataplatform.qdr@a2a.eu:x-CHc_2En4rV' \
  --mail-from 'dataplatform.qdr@a2a.eu' \
  --mail-rcpt 'emanuele.sausto@quantyca.it' \
  --upload-file /root/mail