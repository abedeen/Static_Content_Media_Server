FROM nginx:stable-alpine

# Remove default Nginx configuration (if you're completely replacing it)
RUN rm /etc/nginx/nginx.conf \
    && rm /etc/nginx/conf.d/default.conf

# Copy your custom main Nginx configuration
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Copy your server-specific default.conf into the conf.d directory
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy your video files
COPY ./videos/ /usr/share/nginx/html/videos/

# NEW: Copy your HTML files to the Nginx document root
COPY ./html/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]