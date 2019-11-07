FROM node:8 AS cpm-directory-build
ADD ./ /cpm.directory
WORKDIR /cpm.directory
RUN sh -c "cd frontend && npm install && npm run cpm-directory-build"

FROM nginx:stable-alpine
RUN rm -f /usr/share/nginx/html/index.html
COPY --from=cpm-directory-build /cpm.directory/frontend/dist/* /usr/share/nginx/html/
