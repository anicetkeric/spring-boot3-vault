storage "postgresql" {
  connection_url = "postgres://vaultuser:vaultpass@postgres:5432/vault?sslmode=disable"
  table = "vault_kv_store"   	      # Custom table name for secrets
  #max_parallel   = 4                 # Specifies the maximum number of concurrent requests to PostgreSQL.
  #ha_enabled     = true              # Enable High Availability mode
}

# TCP Listener Configuration
listener "tcp" {
  address = "0.0.0.0:8200"  # Bind to all network interfaces (default port: 8200)
  tls_disable = 1	   # Disable TLS (not recommended for production - 🚨 Only for development!)	
  #tls_cert_file = "/vault/certs/cert.pem"  # Production TLS cert
  #tls_key_file  = "/vault/certs/key.pem"   # Production TLS key
}

# Cluster Configuration
api_addr = "http://vault:8200" 	       # External API addres
#cluster_addr  = "http://vault:8201"  # Internal cluster communication

# Administrative Options
ui = true			     # Enable the web UI
default_lease_ttl = "768h"           # Default secret lifetime (32 days)
max_lease_ttl    = "8760h"           # Maximum secret lifetime (1 year maximum lease)
log_level     = "info"               # Logging level (trace, debug, info, warn, error)
