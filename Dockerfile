FROM python:3.10

WORKDIR /app

RUN pip install --no-cache-dir --upgrade \
                nonebot2[fastapi]==2.0.0rc3 \
                nonebot-adapter-onebot==2.2.1 \ 
                nonebot-plugin-gocqhttp==0.6.5 \
                playwright==1.30.0 \
                -i https://pypi.tuna.tsinghua.edu.cn/simple 
    
# playwright relied by chatgpt/haruka plugin
RUN printf "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free \n \
    deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free \n \
    deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free \n \
    deb http://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free \n" > /etc/apt/sources.list \
    && apt-get update -y

RUN playwright install-deps chromium
