FROM python:3.5.2-alpine
RUN apk --no-cache add openssl
RUN mkdir /usr/src/compliance-opencontrol
WORKDIR /usr/src/compliance-opencontrol
COPY requirements.txt .
RUN pip install -r requirements.txt
ADD https://raw.githubusercontent.com/opencontrol/schemas/master/kwalify/component/v3.1.0.yaml .
COPY . .
CMD ["py.test"]