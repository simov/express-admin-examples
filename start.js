
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
    custom: require(`./config/${name}/custom.json`),
    users: require(`./config/${name}/users.json`),
  }))
  .listen(3000)
