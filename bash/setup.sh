
cd ../bash/

keypair_location=$(cat ./pem_location.txt)
ovpn_location=$(cat ./ovpn_location.txt)

htb_kali_dns=$(aws ec2 describe-instances \
                  --profile default \
                  --region us-east-1 \
                  --output json | \
                   jq '.Reservations | 
                   .[] | 
                   .Instances | 
                   .[] | 
                   select(.State.Name == "running" and 
                   (.Tags | .[] | .Value == "htb_kali")) | 
                   .PublicDnsName' | \
            tr -d '"') 

scp -i $keypair_location $ovpn_location "kali@${htb_kali_dns}":~/.

ssh -i $keypair_location "kali@${htb_kali_dns}"

# openvpn $ovpn_location
