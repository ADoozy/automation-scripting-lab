BACKUP_DIR="/var/backups/home"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz"

sudo mkdir -p "$BACKUP_DIR"

sudo tar -czf "$BACKUP_FILE" /home

sudo find "$BACKUP_DIR" -type f -name "home_backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Backup completed: $BACKUP_FILE"
