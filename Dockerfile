FROM alpine:3.8

RUN apk add --no-cache python3 python3-dev build-base && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache
RUN python -m pip install --upgrade pip \
    && pip install Django==2.0.5 \
    && pip install Cython \
    && pip install jieba \
    && pip install fasttext \
    && pip install gensim \
    && pip install pyLDAvis \
    && pip install xlrd \
    && pip install pymysql \
    && pip pandas 
EXPOSE 19000
CMD ["python"]
