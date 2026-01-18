import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.addons.hawkeyepro',
  appName: 'ADDON-S Hawkeye Pro',
  webDir: 'www',
  bundledWebRuntime: false,
  server: {
    url: 'https://rajeevcp.frappe.cloud/hawkeye',
    cleartext: false
  }
};

export default config;
