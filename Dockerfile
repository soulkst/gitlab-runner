FROM gitlab/gitlab-runner:v15.9.1

RUN curl -fSsL https://get.docker.com | sh
RUN echo "#!/bin/bash" | tee /ext-entrypoint > /dev/null

RUN echo "\n \
#!/bin/bash \n \
CONFIG_TOML=\"/etc/gitlab-runner/config.toml\" \n \
if [ ! -s \$CONFIG_TOML ] || [ \$(grep '\[\[runners\]\]' \$CONFIG_TOML | wc -l ) -eq 0 ] ; \n \
then \n \
  gitlab-runner register -n \n \
fi \n" | tee -a /ext-entrypoint > /dev/null

RUN echo "exec /entrypoint \"\$@\"" | tee -a /ext-entrypoint > /dev/null

RUN chmod +x /ext-entrypoint

ENTRYPOINT ["/usr/bin/dumb-init", "/ext-entrypoint"]

CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]

