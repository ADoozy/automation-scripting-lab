INPUT_FILE="computers.txt"
OUTPUT_FILE="ping_results.txt"

while read -r host; do
    if ping -c 1 -W 1 "$host" > /dev/null; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - $host is UP" >> "$OUTPUT_FILE"
    else
        echo "$(date +"%Y-%m-%d %H:%M:%S") - $host is DOWN" >> "$OUTPUT_FILE"
    fi
done < "$INPUT_FILE"

echo "Ping test completed. Results saved to $OUTPUT_FILE."
