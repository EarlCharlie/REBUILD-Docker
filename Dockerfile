FROM openjdk:11-jre
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
  apt update && \
  apt install -y mariadb-client &&\
  apt clean && \   
  rm -rf \
  /var/cache/debconf/* \
  /var/lib/apt/lists/* \
  /var/log/* \
  /var/tmp/* \
  && rm -rf /tmp/* \
  && wget -c https://github.com/getrebuild/rebuild/releases/download/3.1.4/rebuild-boot-3.1.4.jar && \
  mv rebuild-boot-3.1.4.jar rebuild-boot.jar
ENTRYPOINT ["java", "-XX:+UseG1GC", "-Djava.awt.headless=true", "-Drbpass=", "-DDataDirectory=/rb_data", "-jar","/rebuild-boot.jar"]
