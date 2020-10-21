# Compose Issue

This is a example for issue: https://github.com/docker/compose/issues/xxx


## Problem

After of last update, `docker-compose` volume started acting weird when update locally.


## Steps

To reproduce the problem, follow the steps below:

1. Run `bin/start -b`
2. When is ready, modify and save locally `server/index.js`
3. The `nodemon` will detect modification and restart
4. The file disappears


## License

MIT © [Thiago Lagden](https://github.com/lagden)
