# escape=`
FROM lacledeslan/gamesvr-goldsource

HEALTHCHECK NONE

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

LABEL com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="LL Counter-Strike 1.6 Dedicated Freeplay Server" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-goldsource-cstrike"

COPY --chown=GoldSource:root ./amxmodx/metamod/metamod.so /app/cstrike/addons/metamod/dlls/metamod.so

COPY --chown=GoldSource:root ./amxmodx/amxmodx_base /app/cstrike/addons/amxmodx

COPY --chown=GoldSource:root ./amxmodx/amxmodx_addon_cstrike /app/cstrike/addons/amxmodx

COPY --chown=GoldSource:root ./amxmodx/amxmodx_ll-config /app/cstrike/addons/amxmodx

COPY --chown=GoldSource:root ./dist /app

COPY --chown=GoldSource:root ./ll-tests /app/ll-tests

# UPDATE USERNAME & ensure permissions
RUN usermod -l CStrike GoldSource &&`
    chmod +x /app/ll-tests/*.sh &&`
    mkdir -p /app/cstrike/logs &&`
    chmod 775 /app/cstrike/logs;

USER CStrike

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
