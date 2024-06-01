nvidia-smi --query-gpu=utilization.gpu,memory.used,power.draw --format=csv,noheader | awk -F', ' '{print $1 " " $2 " " $3}'
