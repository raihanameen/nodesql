// Require
// =============================================================================
const express = require('express');

// Configuration
// =============================================================================
const port = 8888;
const hostname = '0.0.0.0';

class Server {
    run() {
        // Create Express apps
        var apiApp = express();

        // Request mapping
        apiApp.use(express.json());

        // Routers to be used with the api
        var apiRouter = express.Router();

        apiRouter.get('/', (req, res) => {
            res.json({ message: 'Hello, world!' });
        });

        // REGISTER OUR ROUTES (all routes prefixed)
        // =============================================================================
        const prefix = '';
        apiApp.use(prefix, apiRouter);

        const apiServer = apiApp.listen(port, hostname, () => {
            console.log(`-------- API Configured --------\n> URL: http://${hostname}:${port}${prefix}\n--------------------------------`)
        });

  }
}

server = new Server();
server.run();