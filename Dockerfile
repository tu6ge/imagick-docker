FROM richarvey/nginx-php-fpm:1.3.10

RUN apk add build-base \
	&& cd ~ \
	&& wget https://www.imagemagick.org/download/ImageMagick-7.0.7-37.tar.gz \
	&& tar -zvxf ImageMagick-7.0.7-37.tar.gz \
	&& cd ImageMagick-7.0.7-37 \
	&& ./configure --prefix=/usr/local/imagemagick \
	&& make \
	&& make install \
	&& apk add autoconf

#RUN pecl install imgick
# 这个过程需要用交互模式 输入 /usr/local/imagemagick

RUN docker-php-ext-enable imagick
