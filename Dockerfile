FROM debian:stable-slim

COPY . /app

# Install Tools
RUN sed -i 's/http:\/\/deb.debian.org/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/http:\/\/security.debian.org/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    gnupg2 \
    curl \
    fontconfig && \
# Install fonts
#    mv -f /app/fonts/* /usr/share/fonts && \
#    fc-cache -fv && \
#    fc-list && \
# Install Node.js
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt-get install -y nodejs && \
# Install Yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && apt install yarn && \
# Install Prince
    mkdir prince &&\
    tar -zxvf /app/prince/prince.tar.gz -C /app/prince --strip-components=1 && \
    yes "/usr/local" | /app/prince/install.sh && \
    rm -r /app/prince && \
#    apt-get install -y \
#    libgif7 \
#    libjpeg62-turbo \
#    liblcms2-2 \
#    libtiff5 \
#    libwebp6 \
#    libwebpdemux2 \
#    libxml2 && \
#    dpkg -i /app/prince.deb && \
#    rm /app/prince.deb && \
# Install node lib
    yarn config set registry https://registry.npm.taobao.org && \
    yarn cache clean && \
    yarn add \
    jsdom \
    got \
    yargs && \
# Remove Caches
    yarn cache clean && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/*
    
WORKDIR /app

ENTRYPOINT ["node", "index.js"]
