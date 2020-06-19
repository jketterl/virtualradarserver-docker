FROM mono:6.8

WORKDIR /opt/vrs

RUN \
    mkdir -p /opt/vrs \
    && mkdir -p /config \
    && mkdir -p /root/.local/share \
    && ln -sf /config /root/.local/share/VirtualRadar

ADD scripts/* /usr/local/bin/
RUN /usr/local/bin/install-vrs.sh

ADD ./logos.tar.gz /opt/vrs/Flags

ADD ./sideviews.tar.gz /opt/vrs/Silhouettes

VOLUME /config

EXPOSE 8080

HEALTHCHECK --start-period=1m --interval=30s --timeout=5s --retries=3 CMD curl --fail http://localhost:8080/VirtualRadar/ || exit 1

ENTRYPOINT ["/usr/local/bin/run-vrs.sh"]