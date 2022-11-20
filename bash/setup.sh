
keypair_location=~/.ssh/kali_instance.pem

htb_kali_dns=$(aws ec2 describe-instances \
                  --profile default \
                  --region us-east-1 \
                  --output json | \
                   jq '.Reservations | .[] | .Instances | .[] | select(.State.Name == "running" and (.Tags | .[] | .Value == "htb_kali")) | .PublicDnsName' | \
            tr -d '"') 

ssh -i $keypair_location "kali@${htb_kali_dns}"
