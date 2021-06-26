#python3の公式イメージDebian10のfullイメージ
FROM python:3

#uidとgidの付与、権限の追加
RUN apt-get -y update && apt-get -y install gosu
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# pythonパッケージの追加
RUN pip install --upgrade pip && pip install pipenv
ENV PIPENV_VENV_IN_PROJECT=1
ENV TZ JST-9

# ディレクトリの作成
RUN mkdir -p /var/opt/dev
