const puppeteer = require('puppeteer');
const imgur = require('imgur');
const files = process.argv.slice(2);
const path = require('path');

/**
 * @param browser {import('puppeteer').Browser}
 * @param file {string}
 */
async function storeFile(browser, file) {
  const page = await browser.newPage();
  await page.goto(`file://${file}`, { waitUntil: 'networkidle0' });
  const filePath = `${file}.png`;
  await page.screenshot({
    type: 'png',
    encoding: 'binary',
    path: filePath,
    fullPage: true,
  })
  console.error(` -> Saved ${filePath}`);
  await page.close();
  return filePath;
}

async function main() {
  const browser = await puppeteer.launch();
  const uploadedAssets = await Promise.all(files.map(async file => {
    const fullPath = path.resolve(file);
    const imagePath = await storeFile(browser, fullPath);
    const result = await imgur.uploadFile(imagePath);
    const url = result.data.link;
    return {
      file,
      url,
    };
  }))
  await browser.close();

  console.log(`Howdy friend! Let's see how your change looks like in Vim!`);

  for (const { file, url } of uploadedAssets) {
    const fileWithoutHtmlExtension = file.replace(/\.html$/, '');
    console.log(`### \`${fileWithoutHtmlExtension}\``);
    const image = `![${file} screenshot](${url})`;
    const link = `[${image}](${url})`;
    console.log(link);
  }
}

main();
