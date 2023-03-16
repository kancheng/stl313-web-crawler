# stl313-web-crawler

Inside that directory, you can run several commands:

  npx playwright test
    Runs the end-to-end tests.

  npx playwright test --project=chromium
    Runs the tests only on Desktop Chrome.

  npx playwright test example
    Runs the tests in a specific file.

  npx playwright test --debug
    Runs the tests in debug mode.

  npx playwright codegen
    Auto generate tests with Codegen.

We suggest that you begin by typing:

    npx playwright test

And check out the following files:
  - .\tests\example.spec.js - Example end-to-end test
  - .\tests-examples\demo-todo-app.spec.js - Demo Todo App end-to-end tests
  - .\playwright.config.js - Playwright Test configuration

Visit https://playwright.dev/docs/intro for more information.

## 爬蟲實驗

1. EX : demo.playwright.dev

```
npx playwright codegen demo.playwright.dev/todomvc
```

2. EX : www.google.com

```
npx playwright codegen www.google.com
```
3. law.wkinfo.com.cn

```
npx playwright codegen law.wkinfo.com.cn
```

```
npx playwright codegen wenshu.court.gov.cn/website/wenshu/181029CR4M5A62CH/index.html
```

```
import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('https://wenshu.court.gov.cn/website/wenshu/181029CR4M5A62CH/index.html');
  await page.getByRole('link', { name: '登录' }).click();
  await page.frameLocator('#contentIframe').getByPlaceholder('手机号码').click();
  await page.frameLocator('#contentIframe').getByPlaceholder('手机号码').fill('');
  await page.frameLocator('#contentIframe').locator('.password-toggle').click();
  await page.frameLocator('#contentIframe').getByPlaceholder('密码').click();
  await page.frameLocator('#contentIframe').getByPlaceholder('密码').fill('');
  await page.frameLocator('#contentIframe').getByText('登录', { exact: true }).click();
  await page.goto('https://wenshu.court.gov.cn/website/wenshu/181029CR4M5A62CH/index.html?');
  await page.getByPlaceholder('输入案由、关键词、法院、当事人、律师').click();
  await page.getByPlaceholder('输入案由、关键词、法院、当事人、律师').fill('指定辩护');
  await page.getByText('搜索').click();
  const page1Promise = page.waitForEvent('popup');
  await page.getByRole('link', { name: '吉米伍勒,路伏龙走私、贩卖、运输、制造毒品罪二审刑事裁定书' }).click();
  const page1 = await page1Promise;
  const downloadPromise = page1.waitForEvent('download');
  await page1.locator('#a_download').click();
  const download = await downloadPromise;
});
```