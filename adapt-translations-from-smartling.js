#!/opt/nodenv/shims/node

/**
 * This file is used by DDG employees to integrate translations coming from Smartling.com into this repo.
 * Community translations do not need to use this files.
 */

const fs = require('fs');
const path = require('path');
const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const copyFiles = (srcDir, destDir) => {
  const files = fs.readdirSync(srcDir)
  return files.map(file => {
    const destFile = path.join(destDir, file.replace('.pot', '.po'));
    const srcFile = path.join(srcDir, file);
    try {
      const dataBuffer = fs.readFileSync(srcFile);
      const fileContent = dataBuffer.toString();
      fs.writeFileSync(destFile, fileContent);
      console.log(`Copied file from ${srcDir} to ${destFile}`);
    } catch (e) {
      console.log(`Got an error trying to copy the file ${srcDir}: ${e.message}`)
    }
  })
}

const start = () => {
  try {
    rl.question('Where are the translations? ', function(baseFolder) {
      // Normalise path input
      baseFolder = baseFolder
        // Fix apexes added when dropping paths in VSCode
        .replace(/^'/, '').replace(/'$/, '')
        // Fix whitespace added at the end of the string by macOS Terminal and iTerm
        .trim();
      console.log(`The base folder is: ${baseFolder}`);
      // Filter for folders named like `it_IT`
      const folders = fs.readdirSync(baseFolder).filter(name => /^[a-z]{2}(-[A-Z]{2})?$/.test(name));
      folders.forEach(name => {
        const localesFolderBase = path.join(__dirname, 'locales/');
        copyFiles(
          path.join(baseFolder, name),
          path.join(localesFolderBase, name.replace('-', '_').replace('nb', 'nb_NO'), 'LC_MESSAGES')
        );
      });
      rl.close();
    });

    rl.on('close', function() {
      console.log('\nAll done.');
      process.exit(0);
    });
  } catch (e) {
    console.log('Something went wrong!');
    console.error(e);
    process.exit(1);
  }
};

start();
