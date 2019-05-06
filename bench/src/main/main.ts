import {
    app
} from 'electron';

import * as Bottle from 'bottlejs';
import log from 'electron-log';
import * as yargs from 'yargs';
import * as fs from 'fs';
var path = require('path')

export const isDevMode = process.mainModule.filename.indexOf( 'app.asar' ) === -1;

/**
 * Require debugging tools. Only
 * runs when in development.
 */
// tslint:disable-next-line:no-var-requires
require('electron-debug')({showDevTools: true});

/**
 *  * On Mac OSX the PATH env variable a packaged app gets does not
 * contain all the information that is usually set in .bashrc, .bash_profile, etc.
 * This package fixes the PATH variable
 */
require('fix-path')();

let argv = yargs.option('v', {
    'alias': 'verbose',
    'count': true,
    'type': 'boolean',
    'describe': 'verbose output to terminal',
}).help().argv;

/**
 * Enabled separate logging for development and packaged environments.
 * Also override console methods so jhjjjjjjjjjjjjjjjjthat future addition will route to
 * using this package.
 */
let adjustedVerbose = parseInt('' + argv.verbose) - 2;
if (isDevMode) {
    if (adjustedVerbose === 0) {
        log.transports.console.level = 'info';
    } else if (adjustedVerbose === 1) {
        log.transports.console.level = 'verbose';
    } else if (adjustedVerbose >= 2) {
        log.transports.console.level = 'debug';
    }

    log.transports.file.level = 'silly';
    //log.transports.console.level = 'silly';

    log.info('In development mode');
    log.info(`Logging to console at '${log.transports.console.level}' level`);
    log.info(`Logging to file (${log.transports.file.findLogPath()}) at '${log.transports.file.level}' level`);
} else {
    if (adjustedVerbose === 0) {
        log.transports.file.level = 'info';
    } else if (adjustedVerbose === 1) {
        log.transports.file.level = 'verbose';
    } else if (adjustedVerbose >= 2) {
        log.transports.file.level = 'debug';
    }

    log.transports.console.level = 'silly';
    log.transports.file.level = 'silly';

    log.info('In production mode');
    log.info(`Logging to console at '${log.transports.console.level}' level`);
    log.info(`Logging to file (${log.transports.file.findLogPath()}) at '${log.transports.console.level}' level`);
}

console.log = log.log;
console.error = log.error;
console.warn = log.warn;
console.info = log.info;
console.debug = log.debug;

/**
 * A user-defined service.
 *
 * Services make up the core functionality of the
 * application. Each service is instantiated
 * once and then becomes available to every other service.
 */
export
interface IService {

    /**
     * The required services.
     */
    requirements: String[];

    /**
     * The service name that is required by other services.
     */
    provides: string;

    /**
     * A function to create the service object.
     */
    activate: (...x: any[]) => any;

    /**
     * Whether the service should be instantiated immediately,
     * or lazy loaded.
     */
    autostart?: boolean;
}

/**
 * Services required by this application.
 */
const services = ['./app', './sessions', './server', './menu', './shortcuts', './utils', './registry']
.map((service: string) => {
    return require(service).default;
});

app.requestSingleInstanceLock()
app.on('second-instance', (event, argv, cwd) => {
  app.quit();
})

/**
 * Load all services when the electron app is
 * ready.
 */
app.on('ready', () => {
    handOverArguments()
    .then( () => {
        let documentsDir = app.getPath('documents');
        let workspaceDir = documentsDir +"/kisia";
        if (!fs.existsSync(workspaceDir)) {
            fs.mkdirSync(workspaceDir, parseInt('0744',8));
        }
        process.chdir(workspaceDir)


        const path37=path.join(process.resourcesPath,"venv","lib","python3.7","site-packages")
        const path36=path.join(process.resourcesPath,"venv","lib","python3.6","site-packages")

        const path37exists = fs.existsSync(path37)
        const path36exists = fs.existsSync(path36)

        if (path37exists && path36exists) {
          process.env.PYTHONPATH=path37 + ":" + path36;
        }
        else {
          if (path37exists) {
            process.env.PYTHONPATH=path37
          }
          else {
            if (path36exists) {
              process.env.PYTHONPATH=path36
            }
            else {
              throw new Error("Can not find python path, looked at "+path37+" and "+path36)
            }
          }
        }

        process.env.PATH=
          path.join(process.resourcesPath,"venv","bin")
          + ":" +
          process.env.PATH;

        //process.env.KITWB_KERNELSPECS=path.join(process.resourcesPath,"venv","share","jupyter","kernels");


        process.env.JUPYTER_CONFIG_DIR=path.join(workspaceDir,"config");
        process.env.JUPYTER_DATA_DIR=path.join(workspaceDir,"data");
        process.env.JUPYTER_RUNTIME_DIR=path.join(workspaceDir,"runtime");
        process.env.JUPYTERLAB_WORKSPACES_DIR=path.join(workspaceDir,"workspaces");
        if (!fs.existsSync(process.env.JUPYTERLAB_WORKSPACES_DIR)) {
            fs.mkdirSync(process.env.JUPYTERLAB_WORKSPACES_DIR, parseInt('0744',8));
        }


        const operatingDir = path.join(workspaceDir,'jupyterlab-cwd');
        if (!fs.existsSync(operatingDir)) {
            fs.mkdirSync(operatingDir, parseInt('0744',8));
        }
        process.env.KISIA_JUPYTERLAB_CWD = operatingDir;

        let serviceManager = new Bottle();
        let autostarts: string[] = [];
        services.forEach((s: IService) => {
            serviceManager.factory(s.provides, (container: any) => {
                let args = s.requirements.map((r: string) => {
                    return container[r];
                });
                //log.info("Activating",s.provides,"with",args)
                return s.activate(...args);
            });
            if (s.autostart) {
                autostarts.push(s.provides);
            }
        });
        log.info("service manager digesting",autostarts)
        serviceManager.digest(autostarts);
    })
    .catch( (e) => {
        log.error(e);
        app.quit();
    });
});


/**
 * When a second instance of the application is executed, this passes the arguments
 * to first instance. Files that are opened with the application on Linux and Windows
 * will by default instantiate a new instance of the app with the file name as the args.
 * This instead opens the files in the first instance of the
 * application.
 */
function handOverArguments(): Promise<void> {
    let promise = new Promise<void>( (resolve, reject) => {
          // Skip JupyterLab Executable
          /*
          for (let i = 1; i < process.argv.length; i ++) {
              app.emit('open-file', null, argv[i]);
          }
          */
          app.emit('open-file', null,"Welcome.ipynb");
        resolve();
    });
    return promise;
}
