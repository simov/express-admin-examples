
var express = require('express')
var admin = require('express-admin')

var name = process.argv[2]

if (!name) {
  console.log('Specify database engine name to use: mysql, pg or sqlite')
  process.exit()
}

express()
  .use(admin({
    config: require(`./config/${name}/config.json`),
    settings: require(`./config/${name}/settings.json`),
    users: require(`./config/users.json`),
    custom: require(`./config/custom.json`),
  }))
  .listen(3000)
