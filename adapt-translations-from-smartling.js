#!/opt/nodenv/shims/node
const fs = require('fs');
const path = require('path');
const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const moveFiles = (srcDir, destDir) => {
  const files = fs.readdirSync(srcDir)
  return files.map(async file => {
    const destFile = path.join(destDir, file.replace('Test', '').replace('.pot', '.po'));
    const srcFile = path.join(srcDir, file);
    try {
      fs.mkdirSync(destDir, {recursive: true})
      fs.renameSync(srcFile, destFile);
      fs.rmdirSync(srcDir);
      console.log(`Moved file from ${srcDir} to ${destFile}`);
    } catch (e) {
      console.log(`Got an error trying to move the file: ${e.message}`)
    }
  })
}

const start = async () => {
  try {
    rl.question('Where are the translations? ', function(baseFolder) {
      console.log(`The base folder is: ${baseFolder}`);
      // filter for folders named like `it_IT`
      const folders = fs.readdirSync(baseFolder).filter(name => /^[a-z]{2}(-[A-Z]{2})?$/.test(name));
      folders.forEach(name => {
        moveFiles(
          path.join(baseFolder, name),
          path.join(baseFolder, name.replace('-', '_').replace('nb', 'nb_NO'), 'LC_MESSAGES')
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
