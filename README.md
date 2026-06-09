# Automated Network Sniffer

Um script em Bash desenvolvido para automatizar o reconhecimento de alvos e a captura de tráfego de rede em uma única execução.

## Como Funciona
Ao definir um alvo (IP ou domínio), o script executa de forma integrada:
1. **Captura:** Inicializa o tshark (Wireshark via CLI) em segundo plano salvando os dados em um arquivo .pcap.
2. **Conectividade:** Dispara pacotes via ping para validar o status do host.
3. **Mapeamento:** Roda uma varredura rápida com o nmap para identificar serviços e portas ativas.

## Requisitos
* Kali Linux ou qualquer sistema baseado em Debian.
* tshark (Wireshark) instalado.
* nmap instalado.

## Como Executar
```bash
chmod +x sniffer.sh
./sniffer.sh
