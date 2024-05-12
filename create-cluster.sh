 PROJECT_ID=$(gcloud config get-value project)
 CLUSTER_NAME=testclusterromil
 gcloud beta container --project "${PROJECT_ID}" clusters create "${CLUSTER_NAME}" --zone "us-central1-c" --no-enable-basic-auth --cluster-version "1.29" --release-channel "regular" --machine-type "n1-standard-4" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "1" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/${PROJECT_ID}/global/networks/default" --subnetwork "projects/${PROJECT_ID}/regions/us-central1/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --security-posture=standard --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-managed-prometheus --enable-shielded-nodes --node-locations "us-central1-c" 
 #T4 nodepool
 gcloud beta container --project "${PROJECT_ID}" node-pools create "testla-t4" --cluster "${CLUSTER_NAME}" --zone "us-central1-c" --machine-type "n1-standard-4" --accelerator "type=nvidia-tesla-t4,count=1,gpu-driver-version=latest" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "2" --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --node-locations "us-central1-c" --spot
 
 gcloud beta container --project "${PROJECT_ID}" node-pools create "nvidia-l4" --cluster "${CLUSTER_NAME}" --zone "us-central1-c" --machine-type "g2-standard-4" --accelerator "nvidia-l4,count=1,gpu-driver-version=latest" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "2" --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --node-locations "us-central1-a" --spot
 

