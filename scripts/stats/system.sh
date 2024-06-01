echo "$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')% $(free -m | awk 'NR==2{printf "%.1f", $3*100/$2 }')%"
