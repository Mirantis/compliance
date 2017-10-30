FROM opencontrolorg/compliance-masonry:latest AS builder
WORKDIR /opencontrol
COPY . .
RUN compliance-masonry get && \
    compliance-masonry docs gitbook FedRAMP-moderate

FROM fellah/gitbook:2.6.7
COPY --from=builder /opencontrol/exports /srv/gitbook/
