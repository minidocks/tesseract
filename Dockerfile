ARG lang="eng"

FROM minidocks/librsvg AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

# https://github.com/tesseract-ocr/tesseract/issues/898#issuecomment-315202167
ENV OMP_THREAD_LIMIT=1

RUN apk add tesseract-ocr tesseract-ocr-data-equ && clean

COPY rootfs /

CMD [ "tesseract" ]

# Lang
FROM latest AS lang
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG lang

RUN for l in $lang; do apk add "tesseract-ocr-data-$l" ; done && clean

FROM latest
