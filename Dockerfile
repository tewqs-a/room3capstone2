# pull base image
FROM public.ecr.aws/docker/library/node:16.18.1-alpine

# directory change
WORKDIR /app

# adding node to PATH
ENV PATH /app/node_modules/.bin:$PATH

# install dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app files
COPY . ./

# Expose port 3000
EXPOSE 3000

# start app
CMD [ "npm", "start" ]