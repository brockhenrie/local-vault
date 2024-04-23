// # Vault configuration template

api_addr      = "https://vault.localhost"
cluster_addr  = "https://clstr.vault.localhost"
cluster_name  = "local"
disable_mlock = true
ui            = true
log_level     = "info"
log_format    = "json"
log_file      = "/vault/logs/vault.log"

// listener "tcp" {
//   address     = "0.0.0.0:8200"
//   tls_disable = 1
// }

listener "tcp" {
  address                            = "0.0.0.0:8200"
  cluster_address                    = "0.0.0.0:8201"
  proxy_protocol_behavior            =  "use_always"
  // proxy_protocol_authorized_addrs = []
  tls_cert_file                      = "/certs/vault.pem"
  tls_key_file                       = "/certs/vault.key.pem"
  tls_client_ca_file                 = "/certs/ca.pem"
  tls_require_and_verify_client_cert = "false"
}
  
storage "file" {
  path = "/vault/data"
}

// storage "raft" {
//   path = "/vault/data/file"
//   node_id = "vault"
// }
