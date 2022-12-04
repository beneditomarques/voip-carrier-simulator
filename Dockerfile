FROM mlan/asterisk:mini-1.1.1
COPY conf /conf
RUN cp -rfv /conf/* / && \
    apk update && \
    apk add wget unzip && \    
    mkdir /var/lib/asterisk/sounds/pt-br     && \    
    cd /var/lib/asterisk/sounds/pt-br && \    
    wget -O core.zip https://www.asterisksounds.org:443/pt-br/download/asterisk-sounds-core-pt-BR-sln16.zip && \    
    wget -O extra.zip https://www.asterisksounds.org:443/pt-br/download/asterisk-sounds-extra-pt-BR-sln16.zip && \    
    unzip -o core.zip && \    
    unzip -o extra.zip
WORKDIR /etc/asterisk
