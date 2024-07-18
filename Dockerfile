FROM mlan/asterisk:mini-1.1.1
COPY conf /conf
RUN cp -rfv /conf/* / && \
    apk update && \
    apk add wget unzip asterisk-sounds-moh && \    
    mkdir -p /var/lib/asterisk/sounds/pt-br     && \    
    cd /var/lib/asterisk/sounds/pt-br && \   
    wget -O audios_pt-br_part01.zip https://raw.githubusercontent.com/beneditomarques/basic-asterisk-training/main/instalacao-do-asterisk/audios_pt-br_part01.zip && \    
    wget -O audios_pt-br_part02.zip https://raw.githubusercontent.com/beneditomarques/basic-asterisk-training/main/instalacao-do-asterisk/audios_pt-br_part02.zip && \    
    wget -O audios_pt-br_part03.zip https://raw.githubusercontent.com/beneditomarques/basic-asterisk-training/main/instalacao-do-asterisk/audios_pt-br_part03.zip && \        
    unzip -o audios_pt-br_part01.zip && \    
    unzip -o audios_pt-br_part02.zip && \    
    unzip -o audios_pt-br_part03.zip && \    
    rm -f *.zip
WORKDIR /etc/asterisk
