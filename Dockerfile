FROM node:14-alpine
ENV NODE_ENV=production
ENV MicrosoftAppId=1648f736-51d5-4d14-8390-24cda550bee6
ENV MicrosoftAppPassword=gh9q_KywhIQ7U55gI_88.zA99xz_.abFLk
ENV SkillHostEndpoint=/api/skills/
ENV SkillId=DialogSkillBot
ENV SkillAppId=
ENV SkillEndpoint=testskill/api/messages
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3978
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
