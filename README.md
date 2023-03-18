# rabbit_backups
RabbitMQ Definitions backups from K8s CronJob

# What include:

1. Terraform code to deploy bucket for backups and creates SA for access to this bucket
2. K8s CronJob based on cloud-sdk:alpine official image for do backups

# What do you need to run this shit:

1. **Terraform** installed
2. **Kubectl** installed
3. **GCP Project**
4. **K8s** cluster
5. **Firewall rule** for access your **RabbitMQ** Hosts by port 15672 from K8s cluster

# Steps to run and deploy:
1.   **For init state** :
   ```
      cd terraform
      terraform init
   ``` 
   <br>
   
2. `` terraform plan `` For show what Terraform will deploy
3. `` terraform apply `` For deploy bucket and SA if Terraform include only 3 correct objects: **Bucket,SA and IAM Member Policy**
4. Get a SA token from GCP GUI in browser <br>
![image](https://user-images.githubusercontent.com/87787051/226133515-422f7c9f-5c01-459e-a4e6-0852b192366b.png)
5. Put this in k8s secret ``configbackuper-gcp-sa`` via Lens for example
6. Create secret ``job-rabbitconfigbackuper-rabbit-secret`` this login:pass pair of some admin user of backuping RabbitMQ host
7. Deploy job ``kubectl apply -f k8s/config-backuper.yaml -n <your_namespace>``
