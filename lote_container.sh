#!/bin/bash

# Função principal do script

main() {
    #Obtém a quantidade de containers a partir do primeiro parâmetro
    local qty_containers=$1

    # Verifica se a quantidade de containers é um número válido
    if ! [[ $qty_containers =~ ^[0-9]+$ ]]
    then
        echo "Por favor, informe um número inteiro válido para a quantidade de containers."
        return 1
    fi

    # Cria um loop para criar a quantidade de containers especificada
    for i in $(seq 1 $qty_containers)
    do
        #Obtém a data atual
        local current_date=$(date)
        
        # Remove container caso exista para não haver conflito
        echo "* Removendo o container criado: nmap_container_$i"
        docker rm "nmap_container_$i"

        #Cria um container com o nmap e o Ubuntu
        docker run -d --name "nmap_container_$i" ubuntu:latest

        #Imprime o nome do container criado e a data atual
        echo "* Container criado: nmap_container_$i em $current_date"

    done
}

#Chama a função principal do script passando os parâmetros
main "$@"

# Permissão para rodar o script
#chmod +x lote_container.sh

# Rodar o script passando os parâmetros
#./lote_container.sh <quantidade_de_containers> 