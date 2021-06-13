FROM node:lts-alpine3.12

LABEL AUTHOR="none" \
      VERSION=0.1.4

ARG KEY="-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEAu2PDF5fq0UWVXUuH1oDr7VuJtipvH/g/FG+v0McE4HpWD/72\ncvto+afShwOnjSP6t1Y1G0HA6dICaTq0eZwIwQyG5GLMoE3KVQv0W2q13qzILJje\nLCG/9ofi5wg6BGvY5YWQxs5SfViseLYBKLm57ZfClzcHeHI1STZiBN0W/qAei7BM\n/7HU6OIG5pxjsLqYKdsoC+psmXuc1Ehf5RaL5sklXo/TVfNtM9phWGkM0TpbKnnm\nU2S/rqJ3OZCWemaZz25UJKc8eof/3q1mYnbS8cXr0FazdfOQdAfDpLqKka2PP5xJ\nhQDJGV0r6d4qVsQr8aHr6T5APkeLQMeWWub0ywIDAQABAoIBABpR39QPhW7RXDJX\naoPpZbnX8pbAjQ0rfAityz8CxR+Wb0Id6JWr1EnElaBbFgyP8iYQGLN0X9k3oxkO\nosy16tDappOrgNw/MN0TKcYxTcwx7oe9DO+b6e+BlJAoqqV2VGegg/44eoOakdb+\nkVkcBQ5nE3DTzNvRBsT6u3e9af5nVznTUpq9D82LV/mPqzeFy1+WGA1j+BvY+qk1\n8/hUmzHe7NDMHTIsIa5K6TQiG9go91JxQ0u+sOcwfDkLW20d/ZX5sglqbtY4ZKPO\nSUGG4Y23zkCj4udC4eWhkpgD12LeGEb1JiPeemdv7j9aOxyJlJHF74n1fkk43kZb\nBuFd6nECgYEA8AzYQpax1qgH/hYiH/BObzS8YdTQ3doP7cumvWxK362wdDNrtZIg\nPtTLg8pIjF+1i60Qq62LwWIdN1v7lqbpH306Il/d7WigpLNeo7Yg7snegJnhpj0z\npm1JaMd4u7Si8WiHvATOGTqreH7ieQ+uo/gvTp4Z1F3ydpVj4rWQyFkCgYEAx9cv\nIfbffrICrfyDJHyeeRIAuH2u+NoIhgHbMsZthJtgiVnWcL6y10+pgirHCNIqzQDb\ndL6nxxjyutS41abJTH1UtIFGrHgE7E8hV+l874OPF4t/08KWOJsaH/jce0WRzTqF\nPXXVym6F72X2wc3H/b55cn7QbOnIpjnUMMjGAcMCgYEAxsUsEb9slN1geOHk8eNv\nXyAg2TV6mimlxPc8I1/Xg+3zzdSCXMAaGUzlFETc2/eogXcV9cJnlgLjRGLTKgUd\nxmhQSgRt5NcdJiQsuozmKjRYHM7PDXNiIG4gOjXp4CwMPK+crXChJDzznXwblbkJ\nmFa6/XNm2fXM/qpnImPL9kkCgYBxk5PfCs8E06kAN1ZVY1ox1xB/yjaqikhz2RQ6\nbFoMFr6r8VoV49wC0Oy25RcPpVrb/lO7qyvx1PUHSCTwkIUxqr18hUikduXdZC/A\nJhxyh+PIbukschgsfcJAT5EHood2C390acci8OPAJsQya4DxbtLZRsewTsJR7uXw\n//rBPwKBgQDsEaCZaHyXwZ/NIzqjEhuxCxIfk57u0GpjEaJG9wAaj7FSOpEIAb8T\nwBL3hNGrqVNa/BknJ71WtsrXhQ1rPuYXNuG+dF/k6YnO3egx2z5k6VfnDrYoU3xD\njBDDQnAXNVl5FV8iKsD40fWCTn74lUHSUq03N2/HC/g43g6E1WFf0w==\n-----END RSA PRIVATE KEY-----"

ENV DEFAULT_LIST_FILE=crontab_list.sh \
    CUSTOM_LIST_MERGE_TYPE=append \
    COOKIES_LIST=/scripts/logs/cookies.list \
    REPO_URL=git@github.com:pkpkgtr1/jd_scripts.git \
    REPO_BRANCH=master

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache bash tzdata git moreutils curl jq openssh-client \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /root/.ssh \
    && echo -e $KEY > /root/.ssh/id_rsa \
    && chmod 600 /root/.ssh/id_rsa \
    && ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts \
    && git clone -b $REPO_BRANCH $REPO_URL /scripts \
    && cd /scripts \
    && mkdir logs \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install \
    && cp /scripts/docker/docker_entrypoint.sh /usr/local/bin \
    && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /scripts

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]