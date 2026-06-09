#!/bin/bash

PS1="$ "

clear
echo "========================================="
echo "    PROJETO AUTOMATED NETWORK SNIFFER    "
echo "========================================="
echo ""

# Pergunta o alvo (IP ou site) ao usuário
read -p "Digite o IP ou domínio para analisar: " ALVO

echo ""
echo "[+] Iniciando captura de pacotes em segundo plano (tshark)..."

# O tshark captura o tráfego em segundo plano (&) e salva no arquivo 'captura.pcap'
# Ele para sozinho assim que coletar 50 pacotes
tshark -c 50 -w captura.pcap > /dev/null 2>&1 &
PID_TSHARK=$!

sleep 1

echo "[+] Executando teste de ping no alvo..."
ping -c 3 "$ALVO"
echo "-----------------------------------------"

echo "[+] Executando varredura rápida de portas (Nmap)..."
nmap -F "$ALVO"
echo "-----------------------------------------"

# Garante que o script espere o tshark terminar a coleta antes de fechar
wait $PID_TSHARK

echo "[SUCESSO] Análise concluída!"
echo "[INFO] O arquivo 'captura.pcap' foi gerado com sucesso."
echo "[INFO] Você já pode abrir esse arquivo direto no Wireshark visual!"
echo "========================================="
