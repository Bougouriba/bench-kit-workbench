var path = require('path');
var fs = require('fs-extra');
var buildDir = path.resolve('./build');
var srcDir = path.resolve('./src');
var file = require('file');
var watch = require('node-watch');

/**
 * This lets you keep style and img assets in the src directory..., so that
 * src/browser/<something>/style/
 * src/browser/<something>/img/ will go to build/out/browser/something/<X>
 */
function copyAssests() {
    process.stdout.write('Copying assets to build from directory...'+srcDir+'\n');
    if (!fs.existsSync(srcDir)) {
        console.error('jupyterlab_app build: could not find source directory.');
        process.exit();
    }

    var themesDest = path.resolve(path.join(buildDir, 'themes'));
    process.stdout.write('Themes directory...'+themesDest+'\n');
    if (!fs.existsSync(themesDest)) {
        console.error('jupyterlab_app build: could not find target directory.');
        process.exit();
    }

    var buildOutDir = path.resolve(path.join(buildDir, 'out'));
    process.stdout.write('Copying assets from src to directory...'+buildOutDir+'\n');
    if (!fs.existsSync(buildOutDir)) {
        console.error('jupyterlab_app build: could not find target directory.');
        process.exit();
    }

    
    // Copy style and img directories into build directory
    file.walkSync(srcDir, (srcPath) => {
        var destPath = srcPath.replace(srcDir, buildOutDir);
        
        if (srcPath.slice(srcPath.length - 'style'.length) == 'style' ||
            srcPath.slice(srcPath.length - 'img'.length) == 'img') {
            fs.copySync(srcPath, destPath);
        }
    });

    // Copy style and img directories into build directory
    var themeBase= path.resolve('./node_modules');
    var themes=['theme-light-extension','theme-dark-extension']
    for(t of themes) {
	var a = themeBase + '/@jupyterlab/'+t+'/style';
	var b = themesDest + '/@jupyterlab/'+t;
	//console.log("A:",a)
	//console.log("B:",b)
    	file.walkSync(a, (srcPath) => {
		var destPath = srcPath.replace(a, b)
		console.log(srcPath,destPath)
		fs.copySync(srcPath,destPath)
    	});
	}


    // Copy html into build directory
    let htmlPath = path.join('browser', 'index.html');
    fs.copySync(path.join(srcDir, htmlPath), path.join(buildOutDir, htmlPath));
    process.stdout.write('Copied bootstrap index.html file from...'+srcDir+' to '+htmlPath+'\n');

    // Copy theme-light into build/out/browser/<icons,images,etc>
    let defaultThemePath = path.join(buildDir,'themes','@jupyterlab','theme-light-extension');
    let browserOutDir = path.join(buildOutDir,'browser');
    file.walkSync(defaultThemePath, (srcPath) => {
	var destPath = srcPath.replace(defaultThemePath, browserOutDir)
	console.log(srcPath,destPath)
	fs.copySync(srcPath,destPath)
    });
    console.log('done');
}
copyAssests();

if (process.argv.length > 2 && process.argv[2] == 'watch') {
    watch(srcDir, {recursive: true}, function(evt, name) {
        if (/(\.css$)|(\.html$)/.test(name)) {
            console.log('Asset chage detected.');
            copyAssests();
        }
    });
}
