const puppeteer = require('puppeteer-core');

(async () => {
  // 使用自訂的 Chrome
  const browser = await puppeteer.launch({
    executablePath: // 對應本地端的 Chrome 位置
      '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    // Windows 可對應 Chrome .exe 檔案
    headless: false // 無外殼的 Chrome，有更佳的效能
  });
  const page = await browser.newPage(); // 開啟新分頁
  await page.goto('https://example.com'); // 進入指定頁面
  await page.screenshot({ path: 'example.png' }); // 截圖，並且存在...

  await browser.close(); // 關閉瀏覽器
})();