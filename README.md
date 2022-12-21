
# Automatizar criação inúmeros container docker com ShellScript qualquer pacote, script ou imagem desejada


## Funcionalidades

Criar imensuráveis contêineres docker rodando qualquer  qualquer pacote, script ou imagem desejada

Iniciando o arquivo com bash
```bash
#!/bin/bash
```

Função principal do script
```bash
main() 
```

Obtém a quantidade de containers a partir do primeiro parâmetro
```bash
local qty_containers=$1
```

Verifica se a quantidade de containers é um número válido
```bash

    if ! [[ $qty_containers =~ ^[0-9]+$ ]]
    then
        echo "Por favor, informe um número inteiro válido para a quantidade de containers."
        return 1
    fi
```

Cria um loop para criar a quantidade de containers especificada
```bash
    for i in $(seq 1 $qty_containers)
    do
```

Obtém a data atual
```bash
local current_date=$(date)
```

Remove container caso exista para não haver conflito
```bash
echo "* Removendo o container criado: nmap_container_$i"
docker rm "nmap_container_$i"
```

Cria um container com o Ubuntu
```bash
docker run -d --name "nmap_container_$i" ubuntu:latest
```

Imprime o nome do container criado e a data atual
```bash
echo "* Container criado: nmap_container_$i em $current_date"
```

Fim da função principal
```bash       
done
```

Chama a função principal do script passando os parâmetros
```bash
main "$@"
```

Permissão para rodar o script
```bash
chmod +x lote_container.sh
```

Rodar o script passando os parâmetros
```bash
./lote_container.sh <quantidade_de_containers> 
```
## Feedback
Se você tiver algum feedback, por favor nos deixe saber por meio do instagram https://www.instagram.com/ogilvanfernandes/

## Autor
- [@GilvanFernandes](https://www.github.com/GilvanFernandes)

## Referência
 - [Ubuntu](https://hub.docker.com/_/ubuntu)

## Contribuindo
Contribuições são sempre bem-vindas!

- Faça um fork do projeto
- Após a modificação faça um pull request ao projeto