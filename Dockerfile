FROM gitlab/gitlab-runner:v15.9.1

RUN echo "#!/bin/bash" | tee /ext-entrypoint > /dev/null

RUN echo "\n \
if [ ! -s "/etc/gitlab-runner/config.toml" ]; \n \
then \n \
  gitlab-runner register -n \n \
fi \n" | tee -a /ext-entrypoint > /dev/null

RUN echo "exec /entrypoint \"\$@\"" | tee -a /ext-entrypoint > /dev/null

RUN chmod +x /ext-entrypoint

ENTRYPOINT ["/usr/bin/dumb-init", "/ext-entrypoint"]

CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]

