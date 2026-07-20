FROM lacledeslan/gamesvr-goldsource

HEALTHCHECK NONE

ARG BUILD_NODE=unspecified
ARG GIT_REVISION=unspecified

LABEL architecture="amd64" \
    com.lacledeslan.build-node="$BUILD_NODE" \
    maintainer="Laclede's LAN <contact@lacledeslan.com>" \
    org.opencontainers.image.description="LL Counter-Strike 1.6 Dedicated Freeplay Server" \
    org.opencontainers.image.revision="$GIT_REVISION" \
    org.opencontainers.image.source="https://github.com/LacledesLAN/gamesvr-goldsource-cstrike" \
    org.opencontainers.image.vendor="Laclede's LAN"

COPY --chown=GoldSource:root ./amxmodx/metamod/metamod.so /app/cstrike/addons/metamod/dlls/metamod.so

COPY --chown=GoldSource:root ./amxmodx/amxmodx_base /app/cstrike/addons/amxmodx

COPY --chown=GoldSource:root ./amxmodx/amxmodx_addon_cstrike /app/cstrike/addons/amxmodx

COPY --chown=GoldSource:root ./amxmodx/amxmodx_ll-config /app/cstrike/addons/amxmodx

COPY --chown=GoldSource:root ./dist /app

COPY --chown=GoldSource:root ./ll-tests /app/ll-tests

# UPDATE USERNAME & ensure permissions
RUN usermod -l CStrike GoldSource && \
    chmod +x /app/ll-tests/*.sh && \
    mkdir -p /app/cstrike/logs && \
    chmod 775 /app/cstrike/logs;

RUN echo 10 > /app/steam_appid.txt;

USER CStrike

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
