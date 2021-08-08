FROM node:lts-alpine3.12

LABEL AUTHOR="none" \
      VERSION=0.1.4

ARG KEY="-----BEGIN RSA PRIVATE KEY-----\nMIIEoAIBAAKCAQEAoyd+WKgVRq9SsoIeUUoM8F3crlR9bysmsXN8RutA+6zX4YQL\n9kf9OSLNK96UChrdS1Brxa2PSwye74iU4kSJPjUJbT/a64IcWzz8qBM9lwBIDhGp\nRAecQOuZVQzuM1HUFLLmCaYPWCv5216NuC/u9TYMfYFgzF0DbXKxgF4es1F2yh9c\n60cNEgEJx0MDluZODv54o0dzIt+rRovK4kODDx4NpkhTtvAmORwQOb14S97+icJN\nLkQGElWdlYWiU9nCyPWkffCF8ybLYiKRT+IMnAWUHYHAOMxqNLBcecDNza5yb3J8\nejvFqg1bCp/4b4Wo+6AqLe3QMdiSlFJDHBg7BQIBIwKCAQB93KNLtN02hz/LiPLQ\n/pxEZao9Vx7vW81kUcZFVmVUb2S1SJuDeVzxj+AahyG+pwJ77ZT3lIR7uUdoU2uJ\n+ls+nfFURzPaP8y7aY+026SKbe5xQNMImCgU0wFBnEK54AoBVs62/HI8tDXGfCQv\nAGfhu/sBu5PQ2gn1WHpNFWgj7SdHimbY7Z67FDIpUFGRljmOmONx7ZcJCd7fLefr\nlLy6+P87YQT2pSm46xLE46M6FnE3uIByjfWDaC6CZ61hHExDC9XmSEG1clXAmsNE\nPCTue7MmfMuQRKSUfkgvG6wTkgmxB1sIOhCtCPFttLe3nd52ovOBwAFBFETGvZvl\nq+SLAoGBANZVgvUZYIoaz8H6RVa+oi9N8EmSUZllBycGvUTjSuPNJqPvfOszqeEi\ny4qNRpB3OSIi1Fri9IxbhvtFZ6SxQgFdSCKlj7lRZHcY4VxNpo0ecShAgZZyDfYO\n/gwuKxxshwBEFfY9V6rxymU56bNpGZ+bR7bhhD7r2GYnp/0bA29BAoGBAMLe+/V2\nU6u41LrsxPdBd+cbK4z4iPmCuMIn+0/gjSXd0RVgVx+1U7mrWK+2uB24wah0CEJO\nhH3Tk2+BJdEIQ6pqGWyRa234678zI0Fd7YiBUuJyOHc7IxoP3zUYAAs00m8WeOpO\nq8w2xZbtKtIh4cMSaMXdG1bCOzuQ9tq66h7FAoGADD9mkamtvr+0GbaHno6M7MKg\nBDQ/LVY67EmHKIIER4gQ1irxMgLzw7jYblE3O3SG7AH9gYlPzYGSr0XLaH8oV9lx\n1hgW12O8mRddVbtLWIVljUWDv3Q7T+OZfQnz1b0PB1RZBsGtPPffrgNPLtLOQ6J5\nIGSoeJ/DOQmUkh7M/wsCgYAWRV6ftcBrZZSnpgfhvlbYlWQQHGds+P8sIdOUGam7\nL0sYYsgg4YXpVWk4pyr8FR1yVmdYCPky85vSOqU8dfkaykwMaGQMkXoHOQtX7Xo7\nfH6AR5Fstk0njMkNYdQeibGmS7YMJj+FDZLsrWP6wgssPJ5Cf6taX1c6AfBTgxNx\nOwKBgDHPafJE3mKrcSYECeZBKXu3SVgkTg1dgq4lX1dXC6MHnWqS+0qsg8tscgks\nLcbwfDVHam9O26cqHj3EozEH3kJN3sZGCy9yZ/X62mXtMTYYmwCV7x1rgAgPe9Ve\nvUxWkI2mkEAkHdCxogDw4frUC9aWykLvzSTmh+zU6iO1yI43\n-----END RSA PRIVATE KEY-----"

ENV DEFAULT_LIST_FILE=crontab_list.sh \
    CUSTOM_LIST_MERGE_TYPE=append \
    COOKIES_LIST=/scripts/logs/cookies.list \
    REPO_URL=git@github.com:pkpkgtr1/jd_scripts.git \
    REPO_BRANCH=master

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache bash tzdata git moreutils curl jq openssh-client python3 openssl wget \
    && rm -rf /var/cache/apk/* \
    && cd /root \ 
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
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
    && pip install -r requirements.txt \
    && cp /scripts/docker/docker_entrypoint.sh /usr/local/bin \
    && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /scripts

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]