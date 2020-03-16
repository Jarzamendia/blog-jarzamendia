FROM jarzamendia/hugo-builder:0.63.1 as builder

ENV HUGO_SOURCE_REPO "https://github.com/Jarzamendia/blog-jarzamendia.git"

RUN git clone "https://${HUGO_SOURCE_REPO}" . ;

RUN hugo;

FROM jarzamendia/caddy:1.0.4

COPY --from=builder /src/public /srv